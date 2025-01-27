//
//  UserLoginApp.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import SwiftUI

@main
struct UserLoginApp: App {
    var body: some Scene {
        WindowGroup {
          SignupView(viewModel: SignupViewModel())
        }
    }
}
