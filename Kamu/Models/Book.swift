import Foundation

struct Book: Decodable {
  let title: String
  let author: String
  let isbn: String?
  let publisher: String?
}
