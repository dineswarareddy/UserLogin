//
//  SignupError.swift
//  UserLogin
//
//  Created by Dineswarareddy on 28/01/25.
//

import Foundation

enum SignupError: Error {
  case performSignupError
}

class SignupErrorHandler: AppErrorHandler {
  override func getErrorMessage(error: Error) -> Toast? {
    
    let errorFormat = super.getErrorMessage(error: error)
    if let _ = errorFormat {
      return errorFormat
    }
    
    guard let localError = error as? SignupError else { return nil }
    switch localError {
    case .performSignupError:
      return Toast(message: FailureMessages.signupError)
    }
  }
}
