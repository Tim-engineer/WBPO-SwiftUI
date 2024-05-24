//
//  UserDetail.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 23/05/2024.
//

import SwiftUI

struct UserDetail: View {
    
    let user: User
    
    @StateObject var viewModel = UserViewModel()
    
    @Binding var isFollowed: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Rectangle()
                    .foregroundStyle(.black)
            }
            .frame(height: 300)
            .ignoresSafeArea()
            
            VStack(spacing: 44) {
                Text("\(user.firstName) \(user.lastName)")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                Text(user.email)
                    .foregroundStyle(.blue)
                Button {
                    isFollowed.toggle()
                } label: {
                    Text(isFollowed ? "Unfollow" : "Follow")
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                .padding(.top, 24)
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    UserDetail(user: LocalUser.user, isFollowing: )
//}
