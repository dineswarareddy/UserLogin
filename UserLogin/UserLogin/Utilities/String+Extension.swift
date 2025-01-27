//
//  String+Extension.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

extension String {
  
  func isValidEmail() -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$", options: .caseInsensitive)
    let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    print("Email validation \(valid)")
    return valid
  }
  
  func isValidName() -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[A-Za-z '-]{3,50}$", options: .caseInsensitive)
    let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    print("Name validation \(valid)")
    return valid
  }
  
  public func isValidPassword() -> Bool {
      let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{6,}$"
      return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
  }
}
