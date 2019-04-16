import UIKit

class Scanner: NSObject {
  private let capture: Capture
  private let completion: (Result<String, Error>) -> Void

  enum Error: Swift.Error {
    case configuration
  }

  init(view: UIView, capture: Capture = Capture(), completion: @escaping (Result<String, Error>) -> Void) {
    self.capture = capture
    self.completion = completion
    super.init()

    capture.delegate = self

    let preview = capture.preview
    preview.frame = view.layer.bounds
    view.layer.addSublayer(preview)
  }

  func start() {
    capture.start()
  }
}

extension Scanner: Scannable {
  func didFail(with failure: Capture.Error) {
    switch failure {
    case .device, .input, .output:
      completion(.failure(.configuration))
    }
  }

  func didRead(code: String) {
    completion(.success(code))
  }
}
