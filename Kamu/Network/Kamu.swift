import Moya

enum Kamu {
  case books
  case borrow(isbn: String)
}

extension Kamu: TargetType {
  var baseURL: URL {
    return URL(string: "http://localhost:9797")!
  }

  var path: String {
    switch self {
    case .books:
      return "/books"
    case let .borrow(isbn):
      return "/books/borrow/\(isbn)"
    }
  }

  var method: Method {
    switch self {
    case .books:
      return .get
    case .borrow:
      return .post
    }
  }

  var sampleData: Data {
    switch self {
    case .books:
      guard let url = Bundle.main.url(forResource: "books", withExtension: "json"),
        let data = try? Data(contentsOf: url) else {
          return Data()
      }
      return data
    case .borrow:
      return Data()
    }
  }

  var task: Task {
    switch self {
    case .books, .borrow:
      return .requestPlain
    }
  }

  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
}

extension Bundle {

  // swiftlint:disable force_cast
  static var test: Bundle? {
    return Bundle(identifier: "com.limamedeiros.KamuUITests")
  }
  // swiftlint:enable force_cast

}
