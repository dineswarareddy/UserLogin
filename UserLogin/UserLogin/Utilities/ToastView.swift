//
//  ToastView.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import SwiftUI


struct Toast: Equatable {
  var message: String
  var duration: Double = 6
  var width: Double = .infinity
}

struct ToastView: View {
  var message: String
  var width = CGFloat.infinity
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Text(message)
      Spacer(minLength: 10)
    }
    .padding()
    .frame(minWidth: 0, maxWidth: width)
    .background(.white)
    .cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .opacity(0.6)
    )
    .padding(.horizontal, 16)
  }
}

