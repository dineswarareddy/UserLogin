//
//  SignupViewModel.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation
import Combine
import SwiftUI

class SignupViewModel: ObservableObject {
  @Published var fullName: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var confirmPassword: String = ""
  @Published var dateOfBirth: Date = Date()
  @Published var gender: Gender = .female
  @Published var path = NavigationPath()
  
  init () { }
  
  func push(_ routPathView: RoutePath) {
         path.append(routPathView)
     }
     
     func pop() {
         path.removeLast()
     }
  
  func validateInputFields() -> Bool {
    return !fullName.isEmpty &&
    email.isValidEmail() &&
    password.isValidPassword() &&
    password == confirmPassword &&
    dateOfBirth.isDOBOlderThan18Y()
  }
}

enum RoutePath: Int, Hashable {
    case signinView = 0
    case homeView = 1
}
