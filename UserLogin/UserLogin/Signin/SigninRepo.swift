//
//  SigninRepo.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

protocol SigninRepo {
  func performSignin(config: SigninConfig,
                     completionHandler: @escaping (Bool) -> Void)
}

class SigninRepoImpl: SigninRepo {
  let service: SigninService
  
  init(service: SigninService = SigninServiceImpl()) {
    self.service = service
  }
  func performSignin(config: SigninConfig,
                     completionHandler: @escaping (Bool) -> Void) {
    service.performSignin(config: config) { response in
      switch response {
      case .success(_):
        completionHandler(true)
      case .failure(_):
        completionHandler(false)
      }
    }
  }
}
