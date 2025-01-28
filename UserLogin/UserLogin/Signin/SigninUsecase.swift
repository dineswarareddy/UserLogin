//
//  SigninUsecase.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

protocol SigninUsecase {
  func performSignin(email: String,
                     password: String,
                     completionHandler: @escaping (Bool) -> Void)
}

class SigninUsecaseImpl: SigninUsecase {
  let repo: SigninRepo
  init(repo: SigninRepo = SigninRepoImpl()) {
    self.repo = repo
  }
  
  func performSignin(email: String,
                     password: String,
                     completionHandler: @escaping (Bool) -> Void) {
    let config = SigninConfig(email: email,
                              password: password)
    return repo.performSignin(config: config,
                              completionHandler: completionHandler)
  }
}
