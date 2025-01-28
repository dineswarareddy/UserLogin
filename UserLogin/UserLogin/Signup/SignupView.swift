//
//  SignupView.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import SwiftUI

struct SignupView: View {
  @StateObject var viewModel: SignupViewModel
  @State var navigatToSignupView: Bool = false
  @State private var navPath = NavigationPath()
  @EnvironmentObject var router: Router
  
  var body: some View {
    ScrollView {
      VStack {
        VStack(alignment: .leading, spacing: 16) {
          TextField(StringConstants.fullName, text: $viewModel.fullName)
            .modifier(InputFieldModifier())
          TextField(StringConstants.email, text: $viewModel.email)
            .modifier(InputFieldModifier())
          SecureField(StringConstants.password, text: $viewModel.password)
            .modifier(InputFieldModifier())
          SecureField(StringConstants.confirmPassword, text: $viewModel.confirmPassword)
            .modifier(InputFieldModifier())
          HStack {
            Text(StringConstants.dob)
              .font(.caption)
            DatePicker("", selection: $viewModel.dateOfBirth, displayedComponents: [.date])
              .datePickerStyle(.compact)
          }
          HStack {
            Text(StringConstants.gender)
              .font(.caption)
            Picker(Gender.female.rawValue, selection: $viewModel.gender) {
              Text(Gender.male.rawValue).tag(Gender.male)
              Text(Gender.female.rawValue).tag(Gender.female)
              Text(Gender.others.rawValue).tag(Gender.others)
            }
          }
        }
        .padding()
        Button {
          print("Button action")
          router.navigate(to: .signin)
        } label: {
          Text(StringConstants.signup)
        }.disabled(!viewModel.validateInputFields())
      }
    }
  }
}

#Preview {
  SignupView(viewModel: SignupViewModel())
}
