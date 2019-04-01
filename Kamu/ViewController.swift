//
//  ViewController.swift
//  Kamu
//
//  Created by Vanessa Medeiros on 18/03/19.
//

import UIKit

class ViewController: UIViewController {

  var scanner: Scanner!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.scanner = Scanner(view: view, outputHandler: { code in print(code) })
    self.scanner.start()
  }


}

