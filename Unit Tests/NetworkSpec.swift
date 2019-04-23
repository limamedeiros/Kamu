@testable import Kamu
import Moya

import Cuckoo
import Nimble
import Quick

class NetworkSpec: QuickSpec {
  override func spec() {
    var sut: Network!

    describe("Network") {
      beforeEach {
        let stubbingProvider = MoyaProvider<Kamu>(stubClosure: MoyaProvider.immediatelyStub)
        sut = Network(provider: stubbingProvider)
      }

      context("It's fetching books") {
        it("Should return an array of books") {
          waitUntil { done in
            sut.books { result in
              switch result {
              case let .success(books):
                expect(books).to(beAKindOf([Book].self))
                done()
              case let .failure(error):
                fail(error.localizedDescription)
              }
            }
          }
        }
      }
    }
  }
}
