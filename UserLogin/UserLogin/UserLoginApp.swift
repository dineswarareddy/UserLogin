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
        SignupView(viewModel: signupViewModel)
          .navigationDestination(for: Router.Destination.self) { destination in
            switch destination {
            case .signin:
              SigninView(viewModel: SigninViewModel())
            case .homePage:
              HomeView(viewModel: HomeViewModel(),
                       userName: "Logged in user")
            }
          }
      }
      .environmentObject(router)
    }
  }
}
