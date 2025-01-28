//
//  SignupService.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

protocol SignupService {
  func performSignup(config: SignupConfig,
                     completion: @escaping (Result<Data, any Error>) -> Void)
}

class SignupServiceImpl: SignupService {
  func performSignup(config: SignupConfig,
                     completion: @escaping (Result<Data, any Error>) -> Void) {
    let requestURL = URLConstructor(operationType: .signup).getRequestURL()
    let dataToPush = config.createHttpRequestBody()
    let request = NetworkRequest(endpointURL: requestURL,
                                 httpMethod: OperationType.signup.httpMethod,
                                 data: dataToPush)
    RestClient().send(request: request) { response, error in
      if let responseData = response?.data {
        completion(.success(responseData))
        return
      }
      completion(.failure(SignupError.performSignupError))
    }
  }
}
