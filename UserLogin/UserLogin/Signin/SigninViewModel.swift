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
  @Published var isAPIProcessing: Bool = false
  let usecase: SigninUsecase
  
  init(usecase: SigninUsecase = SigninUsecaseImpl()) {
    self.usecase = usecase
  }
  
  func performSignin(completion: @escaping () -> ()) {
    isAPIProcessing = true
    usecase.performSignin(email: email,
                          password: password) { [weak self] isSuccess in
      if isSuccess {
        DispatchQueue.main.async {
//          KeychainSwift().set(self?.email ?? "", forKey: "email")
          UserDefaults.standard.setValue(self?.email, forKey: "email")
          self?.isAPIProcessing = false
          completion()
        }
      }
    }
  }
  
  func validateAllInputFields() -> Bool {
    return email.isValidEmail() && !password.isEmpty
  }
}
