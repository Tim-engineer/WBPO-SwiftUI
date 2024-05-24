//
//  ContentView.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 22/05/2024.
//

import SwiftUI

struct ListOfUsersView: View {
    
    @StateObject var viewModel = UserViewModel()
    
    @State private var isFollowed = false
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.users, id: \.id) { user in
                NavigationLink(value: user) {
                    ListCell(user: user)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetail(user: user, isFollowed: $isFollowed)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .task {
            viewModel.getUsers()
        }
    }
}

#Preview {
    ListOfUsersView()
}

//NavigationStack {
//    Button {
//        showingDetail.toggle()
//    } label: {
//        List(viewModel.users, id: \.id) { user in
//            UserRow(user: user)
//        }
//        .listStyle(.grouped)
//        .navigationTitle("Users")
//    }
//}
//.sheet(isPresented: $showingDetail) {
//    UserDetail(user: viewModel.users[0])
//}
//.alert(item: $viewModel.alertItem) { alertItem in
//    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
//}
//.task {
//    viewModel.getUsers()
//}
