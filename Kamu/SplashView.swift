import Lottie
import UIKit

class SplashView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor(named: "Background")

    let animation = AnimationView(asset: "Wings")
    addSubview(animation)
    animation.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      animation.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0),
      animation.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0),
    ])

    animation.play()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
