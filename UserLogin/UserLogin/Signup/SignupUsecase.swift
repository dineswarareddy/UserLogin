//
//  SignupUsecase.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

struct SignupUsecaseConfigModel {
  let userName: String
  let password: String
  let email: String
  let dob: Date
  let gender: Gender
}

protocol SignupUsecase {
  func performSignup(usecaseModel: SignupUsecaseConfigModel,
                     completion: @escaping (Bool) -> Void)
}

class SignupUsecaseImpl: SignupUsecase {
  let repo: SignupRepo
  
  init(repo: SignupRepo = SignupRepoImpl()) {
    self.repo = repo
  }
  
  func performSignup(usecaseModel: SignupUsecaseConfigModel,
                     completion: @escaping (Bool) -> Void) {
    repo.performSignup(config: SignupConfig.getFromUsecaseConfig(config: usecaseModel)) { response in
      
    }
  }
}
