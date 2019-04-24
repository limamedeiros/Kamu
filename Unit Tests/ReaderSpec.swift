import AVFoundation
@testable import Kamu

import Cuckoo
import Nimble
import Quick

class ScannerSpec: QuickSpec {
  override func spec() {
    var mockCapture: MockCapture!
    var view: UIView!

    var sut: Reader!

    beforeEach {
      mockCapture = MockCapture()

      stub(mockCapture) { stub in
        when(stub.delegate.set(any(Scannable?.self))).thenCallRealImplementation()
        when(stub.delegate.get).thenCallRealImplementation()
        when(stub.preview.get).thenCallRealImplementation()
        when(stub.start()).thenDoNothing()
      }
    }

    describe("Reader") {
      beforeEach {
        view = UIView()
        sut = Reader(view: view, capture: mockCapture, completion: { _ in })
      }

      context("It's initialized") {
        it("Should add an AVCaptureVideoPreviewLayer layer as a sublayer") {
          expect(view.layer.sublayers?.last).to(beAKindOf(AVCaptureVideoPreviewLayer.self))
          expect(view.layer.sublayers?.last).to(be(mockCapture.preview))
        }

        it("Should be set as delegate of Capture") {
          expect(mockCapture.delegate).to(be(sut))
        }
      }
    }

    describe("Starting") {
      context("Configuring capture session") {
        it("Should error since capture session is not available") {
          sut = Reader(view: view, capture: mockCapture, completion: { result in
            switch result {
            case .success:
              fail()
            case let .failure(error):
              expect(error).to(beAKindOf(Reader.Error.self))
            }
          })

          sut.start()
          mockCapture.delegate?.didFail(with: .device)
        }
      }
    }

    describe("Reading") {
      context("Found ISBN") {
        it("Should receive ISBN code in completion") {
          sut = Reader(view: view, capture: mockCapture, completion: { result in
            switch result {
            case let .success(code):
              expect(code).to(be("123"))
            case let .failure(error):
              fail(error.localizedDescription)
            }
          })

          sut.start()
          mockCapture.delegate?.didRead(code: "123")
        }
      }
    }
  }
}
