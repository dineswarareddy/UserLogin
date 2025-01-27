//
//  SigninViewModel.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation
import Combine

class SigninViewModel: ObservableObject {
  @Published var email: String = ""
  @Published var password: String = ""
  
  func performSignin() {
    
  }
}
