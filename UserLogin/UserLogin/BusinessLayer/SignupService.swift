//
//  SignupService.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

struct SignupConfig: Codable {
  let fullName: String
  let email: String
  let password: String
  let dob: String
  let gender: String
  
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

protocol SignupService {
  
}

class SignupServiceImpl: SignupService {
  
}
