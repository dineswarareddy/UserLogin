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
  @EnvironmentObject var router: Router
  @Published var isApiProcessing: Bool = false
  
  let usecase: SignupUsecase
  init (usecase: SignupUsecase = SignupUsecaseImpl()) {
    self.usecase = usecase
  }
  
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
  
  func initiateUserSignup(completion: @escaping () -> ()) {
    isApiProcessing = true
    let config = SignupUsecaseConfigModel(userName: fullName,
                                          password: password,
                                          email: email,
                                          dob: dateOfBirth,
                                          gender: gender)
    usecase.performSignup(usecaseModel: config) { [weak self] isSuccess in
      DispatchQueue.main.async {
        print("is login success: \(isSuccess)")
        self?.isApiProcessing = false
        if isSuccess {
          completion()
//          self?.router.navigate(to: .signin)
        }
      }
    }
  }
}

enum RoutePath: Int, Hashable {
    case signinView = 0
    case homeView = 1
}
