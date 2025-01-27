//  URLConstructionHelper.swift

import Foundation

enum OperationType {
  case signup
  case signin
  
  var httpMethod: HTTPMethod {
    switch self {
    case .signin,
        .signup:
      return .post
    }
  }
  
  // ****
  // For time being adding path params statically. Generally we have to pass those to Network Request creation class and append these to URL.
  var urlPath: String {
    switch self {
    case .signin: "signup"
    case .signup: "signin"
    }
  }
}

struct URLConstructor {
  var baseURL = "https://dinesh.free.beeceptor.com/"
  let operationType: OperationType
  internal init(operationType: OperationType) {
    self.operationType = operationType
  }
  
  func getRequestURL() -> String {
    return (baseURL + operationType.urlPath)
  }
}
