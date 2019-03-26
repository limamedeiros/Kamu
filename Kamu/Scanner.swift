//
//  Scanner.swift
//  Kamu
//
//  Created by Vanessa Medeiros on 26/03/19.
//

import UIKit
import AVFoundation

class Scanner: NSObject, AVCaptureMetadataOutputObjectsDelegate {
  private let viewController: UIViewController
  private let outputHandler: (String) -> Void

  init(viewController: UIViewController, outputHandler: @escaping (String) -> Void) {
    self.viewController = viewController
    self.outputHandler = outputHandler

    super.init()

    if let captureSession = captureSession {
      let preview = AVCaptureVideoPreviewLayer(session: captureSession)
      preview.frame = viewController.view.layer.bounds
      preview.videoGravity = .resizeAspectFill
      viewController.view.layer.addSublayer(preview)
    }
  }

  private lazy var captureSession: AVCaptureSession? = {
    guard let device = AVCaptureDevice.default(for: .video),
      let input = try? AVCaptureDeviceInput(device: device) else {
      return nil
    }

    let output = AVCaptureMetadataOutput()
    let session = AVCaptureSession()

    guard session.canAddInput(input), session.canAddOutput(output),
      let viewController = viewController as? AVCaptureMetadataOutputObjectsDelegate else {
      return nil
    }

    session.addInput(input)
    session.addOutput(output)

    output.setMetadataObjectsDelegate(viewController, queue: DispatchQueue.main)
    output.metadataObjectTypes = [.ean13, .ean8]

    return session
  }()

  func stop() {
    captureSession?.stopRunning()
  }

  func start() {
    captureSession?.startRunning()
  }

  func metadataOutput(_ output: AVCaptureMetadataOutput,
                      didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
    stop()

    guard let metadataObject = metadataObjects.first,
      let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
      let code = readableObject.stringValue else {
      return
    }
    outputHandler(code)
  }

}
