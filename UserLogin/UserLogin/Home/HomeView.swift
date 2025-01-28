//
//  HomeView.swift
//  UserLogin
//
//  Created by Dineswarareddy on 28/01/25.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel: HomeViewModel
  let userName: String
  
  var body: some View {
    VStack {
      Text("Logged in as : \(userName)")
    }
    .navigationTitle("Dashboard")
  }
}

#Preview {
  HomeView(viewModel: HomeViewModel(), userName: "Logged in User name")
}
