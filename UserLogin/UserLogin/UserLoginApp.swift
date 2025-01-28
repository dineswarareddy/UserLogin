//
//  UserLoginApp.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import SwiftUI

@main
struct UserLoginApp: App {
  @StateObject var router = Router()
  @StateObject var signupViewModel = SignupViewModel()
  
  var body: some Scene {
    WindowGroup {
      NavigationStack(path: $router.navPath) {
        if let userEmail = KeychainSwift().get("email") {
          HomeView(viewModel: HomeViewModel(),
                   userName: userEmail)
        } else {
          SignupView(viewModel: signupViewModel)
            .navigationDestination(for: Router.Destination.self) { destination in
              switch destination {
              case .signin:
                SigninView(viewModel: SigninViewModel())
              case .homePage(let email):
                HomeView(viewModel: HomeViewModel(),
                         userName: email)
              }
            }
        }
      }
      .environmentObject(router)
    }
  }
}
