//
//  SignupRepo.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

protocol SignupRepo {
  func performSignup(config: SignupConfig,
                     completionHandler: @escaping (Bool) -> Void)
}

class SignupRepoImpl: SignupRepo {
  let service: SignupService
  
  init(service: SignupService = SignupServiceImpl()) {
    self.service = service
  }
  func performSignup(config: SignupConfig,
                     completionHandler: @escaping (Bool) -> Void) {
    service.performSignup(config: config) { response in
      
    }
  }
}
