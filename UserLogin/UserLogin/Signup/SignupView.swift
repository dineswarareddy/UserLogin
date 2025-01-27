//
//  SignupView.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import SwiftUI

struct SignupView: View {
  @StateObject var viewModel: SignupViewModel
  
  var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 16) {
        TextField(StringConstants.fullName, text: $viewModel.fullName)
          .modifier(InputFieldModifier())
        TextField(StringConstants.email, text: $viewModel.email)
          .modifier(InputFieldModifier())
        TextField(StringConstants.password, text: $viewModel.password)
          .modifier(InputFieldModifier())
        TextField(StringConstants.confirmPassword, text: $viewModel.confirmPassword)
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
    }
    Button {
      
    } label: {
      Text(StringConstants.signup)
    }
  }
}

#Preview {
  SignupView(viewModel: SignupViewModel())
}
