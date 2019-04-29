//
//  SplashView.swift
//  Kamu
//
//  Created by Vanessa Medeiros on 26/04/19.
//

import UIKit
import Lottie

class SplashView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor(named: "Background")

    let animation = AnimationView(name: "kamu_wings_animation_v2")
    addSubview(animation)
    animation.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      animation.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0),
      animation.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0)
    ])

//    animation.play()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

}
