import Lottie
import UIKit

class SplashViewController: UIViewController {
  private lazy var customView: SplashView = {
    SplashView()
  }()

  override func loadView() {
    view = customView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
