//
//  UserSigninConfig.swift
//  UserLogin
//
//  Created by Dineswarareddy on 28/01/25.
//

import Foundation

struct SigninConfig: Codable {
  let email: String
  let password: String
  
  func createHttpRequestBody() -> Data? {
    let encoder = JSONEncoder()
    do {
      let jsonData = try encoder.encode(self)
      return jsonData
    } catch {
      print("Error encoding FilterCriteria: \(error)")
      return nil
    }
  }
}

