//
//  SigninError.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

enum SigninError: Error {
  case performSigninError
}

class SigninErrorHandler: AppErrorHandler {
  override func getErrorMessage(error: Error) -> Toast? {
    
    let errorFormat = super.getErrorMessage(error: error)
    if let _ = errorFormat {
      return errorFormat
    }
    
    guard let localError = error as? SigninError else { return nil }
    switch localError {
    case .performSigninError:
      return Toast(message: FailureMessages.signinError)
    }
  }
}
