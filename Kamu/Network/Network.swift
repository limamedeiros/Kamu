import Moya

class Network {
  let provider: MoyaProvider<Kamu>

  init(provider: MoyaProvider<Kamu> = MoyaProvider<Kamu>()) {
    self.provider = provider
  }

  func request<T: Decodable>(_: T.Type, target: Kamu, completion: @escaping Completion<T>) {
    provider.request(target) { result in
      do {
        let response = try result.get()
        _ = try response.filterSuccessfulStatusCodes()
        completion(.success(try response.map(T.self)))
      } catch {
        completion(.failure(error))
      }
    }
  }
}

#warning("TODO: Refactor switch")
extension Network {
  func books(_ completion: @escaping Completion<[Book]>) {
    request(Response.self, target: .books) { result in
      switch result {
      case let .success(response):
        completion(.success(response.results))
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }
}
