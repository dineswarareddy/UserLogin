//
//  ContentView.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import SwiftUI

struct SigninView: View {
  @StateObject var viewModel: SigninViewModel

  var body: some View {
    VStack(alignment: .center, spacing: 50) {
      VStack(spacing: 20) {
        TextField(StringConstants.email, text: $viewModel.email)
          .modifier(InputFieldModifier())
        TextField(StringConstants.password, text: $viewModel.password)
          .modifier(InputFieldModifier())
      }
      Button {
        
      } label: {
        Text(StringConstants.loginTitle)
      }
    }
    .padding()
  }
}

#Preview {
  SigninView(viewModel: SigninViewModel())
}
