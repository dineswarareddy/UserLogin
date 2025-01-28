//
//  Router.swift
//  UserLogin
//
//  Created by Dineswarareddy on 28/01/25.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
  
  public enum Destination: Int, Codable, Hashable {
    case signin = 0
    case homePage = 2
  }
  
  @Published var navPath = NavigationPath()
  
  func navigate(to destination: Destination) {
    navPath.append(destination)
  }
  
  func navigateBack() {
    navPath.removeLast()
  }
  
  func navigateToRoot() {
    navPath.removeLast(navPath.count)
  }
}
