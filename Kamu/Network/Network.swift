//
//  Network.swift
//  Kamu
//
//  Created by Vanessa Medeiros on 17/04/19.
//

import Moya

class Network {

  let provider: MoyaProvider<Kamu>

  init(provider: MoyaProvider<Kamu> = MoyaProvider<Kamu>()) {
    self.provider = provider
  }

  func request<T: Decodable>(_ type: T.Type, target: Kamu, completion: @escaping (Result<T, Error>) -> Void) {
    provider.request(target) { result in
      switch result {
      case let .success(response):
        do {
          _ = try response.filterSuccessfulStatusCodes()
          completion(.success(try response.map(T.self)))
        } catch {
          completion(.failure(error))
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }

}

extension Network {

  func books(_ completion: @escaping (Result<[Book], Error>) -> Void) {
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

