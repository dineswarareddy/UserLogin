//
//  SigninService.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

struct SigninConfig: Codable {
  let email: String
  let password: String
  
  func createHttpRequestBody() -> Data? {
    let encoder = JSONEncoder()
    do {
      let jsonData = try encoder.encode(self)
      return jsonData
    } catch {
      print("Error encoding FilterCriteria: \(error)")
      return nil
    }
  }
}

protocol SigninService {
  func performSignin(config: SigninConfig,
                     completion: @escaping (Result<Data, Error>) -> Void)
}

class SigninServiceImpl: SigninService {
  func performSignin(config: SigninConfig,
                     completion: @escaping (Result<Data, any Error>) -> Void) {
    let requestURL = URLConstructor(operationType:  .signin).getRequestURL()
    let dataToPush = config.createHttpRequestBody()
    let request = NetworkRequest(endpointURL: requestURL,
                                 httpMethod: OperationType.signin.httpMethod,
                                 data: dataToPush)
    RestClient().send(request: request) { response, error in
      if let responseData = response?.data {
        completion(.success(responseData))
        return
      }
      completion(.failure(SigninError.performSigninError))
    }
  }
}
