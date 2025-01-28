//
//  HomeView.swift
//  UserLogin
//
//  Created by Dineswarareddy on 28/01/25.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel: HomeViewModel
  var userName: String
  
  var body: some View {
    Text("Logged in as : \(userName)")
  }
}

#Preview {
  HomeView(viewModel: HomeViewModel(), userName: "Logged in User name")
}
