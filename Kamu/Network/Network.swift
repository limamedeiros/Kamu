import Moya

class Network {
  let provider: MoyaProvider<Kamu>

  init(provider: MoyaProvider<Kamu> = MoyaProvider<Kamu>()) {
    self.provider = provider
  }

  func request<T: Decodable>(target: Kamu, completion: @escaping Completion<T>) {
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

extension Network {
  func books(_ completion: @escaping Completion<[Book]>) {
    request(target: .books) { (result: Result<Root<[Book]>, Error>) -> Void in
      switch result {
      case let .success(response):
        completion(.success(response.results))
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }
}
