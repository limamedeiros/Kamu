//
//  Response.swift
//  Kamu
//
//  Created by Vanessa Medeiros on 22/04/19.
//

import Foundation

struct Response: Decodable {
  let count: Int
  let results: [Book]
}
