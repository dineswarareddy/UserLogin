//
//  SignupViewModel.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation
import Combine

class SignupViewModel: ObservableObject {
  @Published var fullName: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var confirmPassword: String = ""
  @Published var dateOfBirth: Date = Date()
  @Published var gender: Gender = .female
  
  init () { }
  
  func validateInputFields() -> Bool {
    return !fullName.isEmpty &&
    email.isValidEmail() &&
    password.isValidPassword() &&
    password == confirmPassword &&
    dateOfBirth.isDOBOlderThan18Y()
  }
}
