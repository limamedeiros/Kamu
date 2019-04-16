import AVFoundation

class Capture: NSObject {
  public weak var delegate: Scannable?

  private let session: AVCaptureSession
  private let sessionQueue = DispatchQueue(label: "sessionQueue")

  private let dispatchGroup = DispatchGroup()

  enum Error: Swift.Error {
    case device
    case input
    case output
  }

  public lazy var preview: CALayer = {
    let preview = AVCaptureVideoPreviewLayer(session: session)
    preview.videoGravity = .resizeAspectFill
    return preview
  }()

  init(session: AVCaptureSession = AVCaptureSession()) {
    self.session = session
    super.init()
  }

  func start() {
    sessionQueue.async {
      self.configure()
    }

    dispatchGroup.notify(queue: .main) { [weak self] in
      self?.session.startRunning()
    }
  }

  func configure() {
    dispatchGroup.enter()
    session.beginConfiguration()

    guard let device = AVCaptureDevice.default(for: .video),
      let input = try? AVCaptureDeviceInput(device: device) else {
      delegate?.didFail(with: .device)
      session.commitConfiguration()
      return
    }

    let output = AVCaptureMetadataOutput()

    guard session.canAddInput(input) else {
      delegate?.didFail(with: .input)
      session.commitConfiguration()
      return
    }

    guard session.canAddOutput(output) else {
      delegate?.didFail(with: .output)
      session.commitConfiguration()
      return
    }

    session.addInput(input)
    session.addOutput(output)

    output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
    output.metadataObjectTypes = [.ean13, .ean8]

    session.commitConfiguration()
    dispatchGroup.leave()
  }
}

extension Capture: AVCaptureMetadataOutputObjectsDelegate {
  func metadataOutput(_: AVCaptureMetadataOutput,
                      didOutput metadataObjects: [AVMetadataObject], from _: AVCaptureConnection) {
    session.stopRunning()

    guard let metadataObject = metadataObjects.first,
      let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
      let code = readableObject.stringValue else {
      return
    }
    delegate?.didRead(code: code)
  }
}

protocol Scannable: AnyObject {
  func didFail(with failure: Capture.Error)
  func didRead(code: String)
}
