//
//  UserDetail.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 23/05/2024.
//

import SwiftUI

struct UserDetail: View {
    
    let user: UserObject
    
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
                Button {
                    user.isFollowed.toggle()
                } label: {
                    Text(user.isFollowed ? "Unfollow" : "Follow")
                }
                .tint(user.isFollowed ? .red : .green)
                .buttonStyle(.bordered)
                .controlSize(.large)
                Button {
                    
                } label: {
                    Text(user.email)
                        .foregroundStyle(.blue)
                    .buttonStyle(.bordered)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(LinearGradient(colors: [.orange.opacity(0.2), .blue.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    UserDetail(user: LocalUser.user)
}

struct LocalUser {
    static let user = UserObject(id: 1, email: "example@example.com", firstName: "Tim", lastName: "Matlak", avatar: "brooks", isFollowed: false)
}
