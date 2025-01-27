//
//  SigninRepo.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

protocol SigninRepo {
  func performSignin(completionHandler: @escaping (Bool) -> Void)
}

class SigninRepoImpl: SigninRepo {
  func performSignin(completionHandler: @escaping (Bool) -> Void) {
    
  }
}
