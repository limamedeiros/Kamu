import UIKit

class ViewController: UIViewController {
  var scanner: Scanner!

  override func viewDidLoad() {
    super.viewDidLoad()

    scanner = Scanner(view: view, completion: { result in
      switch result {
      case let .success(code):
        print("Code: \(code)")
      case .failure:
        print("Fail at configuration")
      }
    })
    scanner.start()
  }
}
