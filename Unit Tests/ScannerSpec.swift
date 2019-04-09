import AVFoundation
@testable import Kamu

import Nimble
import Quick

class ScannerSpec: QuickSpec {
  override func spec() {
    var view: UIView!
    var completion: ((Result<String, Kamu.Scanner.Error>) -> Void)!

    var scanner: Kamu.Scanner!

    beforeEach {
      view = UIView()
      completion = { result in
        print("Scanning!!! \(result)")
      }
      scanner = Kamu.Scanner(view: view, completion: completion)
    }

    describe("Scanner") {
      context("It's initialized") {
        it("Should add a preview layer as a sublayer") {
          expect(view.layer.sublayers?.last).to(beAKindOf(AVCaptureVideoPreviewLayer.self))
        }
      }
    }

    describe("Scanning") {
      context("Found ISBN") {
        it("Should receive ISBN code in ouputHandler") {}
      }
    }
  }
}
