import Moya

enum Kamu {
  case books
  case borrow(isbn: String)
}

extension Kamu: TargetType {
  var baseURL: URL {
    return URL(string: "http://localhost:9797/")!
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
    return Data()
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
