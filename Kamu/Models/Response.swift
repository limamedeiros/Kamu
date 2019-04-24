import Foundation

struct Root<T: Decodable>: Decodable {
  let results: T
}
