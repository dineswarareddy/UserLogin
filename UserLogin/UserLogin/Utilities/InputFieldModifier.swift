//
//  InputFieldModifier.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation
import SwiftUI

struct InputFieldModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(10)
      .clipShape(
          RoundedRectangle(cornerRadius: 10)
      )
      .overlay(
          RoundedRectangle(cornerRadius: 10)
              .stroke(.gray, lineWidth: 1)
      )
      .shadow(radius: 5)
  }
}
