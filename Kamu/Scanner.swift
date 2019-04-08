import AVFoundation
import UIKit

class Scanner: NSObject {
  private let outputHandler: (String) -> Void

  init(view: UIView, outputHandler: @escaping (String) -> Void) {
    self.outputHandler = outputHandler

    super.init()

    if let captureSession = captureSession {
      let preview = AVCaptureVideoPreviewLayer(session: captureSession)
      preview.frame = view.layer.bounds
      preview.videoGravity = .resizeAspectFill
      view.layer.addSublayer(preview)
    }
  }

  private lazy var captureSession: AVCaptureSession? = {
    guard let device = AVCaptureDevice.default(for: .video),
      let input = try? AVCaptureDeviceInput(device: device) else {
      return nil
    }

    let output = AVCaptureMetadataOutput()
    let session = AVCaptureSession()

    guard session.canAddInput(input), session.canAddOutput(output) else {
      return nil
    }

    session.addInput(input)
    session.addOutput(output)

    output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
    output.metadataObjectTypes = [.ean13, .ean8]

    return session
  }()

  func stop() {
    captureSession?.stopRunning()
  }

  func start() {
    captureSession?.startRunning()
  }
}

extension Scanner: AVCaptureMetadataOutputObjectsDelegate {
  func metadataOutput(_: AVCaptureMetadataOutput,
                      didOutput metadataObjects: [AVMetadataObject], from _: AVCaptureConnection) {
    stop()

    guard let metadataObject = metadataObjects.first,
      let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
      let code = readableObject.stringValue else {
      return
    }
    outputHandler(code)
  }
}
