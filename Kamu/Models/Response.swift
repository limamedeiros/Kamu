import Foundation

struct Response: Decodable {
  let count: Int
  let results: [Book]
}
