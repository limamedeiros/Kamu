//
//  Book.swift
//  Kamu
//
//  Created by Vanessa Medeiros on 17/04/19.
//

import Foundation

struct Book: Decodable {
  let title: String
  let author: String
  let isbn: String?
  let publisher: String?
}
