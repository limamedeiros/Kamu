//
//  SplashViewController.swift
//  Kamu
//
//  Created by Vanessa Medeiros on 26/04/19.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

  private lazy var customView: SplashView = {
    return SplashView()
  }()

  override func loadView() {
    view = customView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}
