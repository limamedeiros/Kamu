import UIKit

class ViewController: UIViewController {
  var scanner: Scanner!

  override func viewDidLoad() {
    super.viewDidLoad()
    scanner = Scanner(view: view, outputHandler: { code in print(code) })
    scanner.start()
  }
}
