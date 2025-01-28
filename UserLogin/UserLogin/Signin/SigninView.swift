//
//  ContentView.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import SwiftUI

struct SigninView: View {
  @StateObject var viewModel: SigninViewModel
  @EnvironmentObject var router: Router
  
  var body: some View {
    VStack(alignment: .center, spacing: 50) {
      VStack(spacing: 20) {
        TextField(StringConstants.email, text: $viewModel.email)
          .modifier(InputFieldModifier())
        SecureField(StringConstants.password, text: $viewModel.password)
          .modifier(InputFieldModifier())
      }
      Button {
        viewModel.performSignin {
          router.navigate(to: .homePage)
        }
      } label: {
        Text(StringConstants.loginTitle)
      }
      .disabled(!viewModel.validateAllInputFields() || viewModel.isAPIProcessing)
    }
    .navigationTitle(StringConstants.loginTitle)
    .padding()
  }
}

#Preview {
  SigninView(viewModel: SigninViewModel())
}
