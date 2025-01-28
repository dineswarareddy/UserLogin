//
//  UserSignupConfig.swift
//  UserLogin
//
//  Created by Dineswarareddy on 28/01/25.
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
  
  static func getFromUsecaseConfig(config: SignupUsecaseConfigModel) -> Self {
    return Self(fullName: config.userName,
                email: config.email,
                password: config.password,
                dob: config.dob.getStringFormatdd_mm_yyyy(),
                gender: config.gender.rawValue)
  }
}
