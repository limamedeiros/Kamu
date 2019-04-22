import UIKit

class ViewController: UIViewController {
  var reader: Reader!

  override func viewDidLoad() {
    super.viewDidLoad()

    let network = Network()

    network.books { result in
      switch result {
      case let .success(books):
        dump(books)
      case let .failure(error):
        dump(error)
      }
    }

//    reader = Reader(view: view, completion: { result in
//      switch result {
//      case let .success(code):
//        print("Code: \(code)")
//      case .failure:
//        print("Fail at configuration")
//      }
//    })
//    reader.start()
  }
}
