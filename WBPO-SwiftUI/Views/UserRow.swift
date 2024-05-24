//
//  UserRow.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 22/05/2024.
//

import SwiftUI

struct UserRow: View {
    
    let user: User
    
    @Binding var isFollowed: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(.ultraThinMaterial)
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        isFollowed.toggle()
                    } label: {
                        Text(isFollowed ? "Unfollow" : "Follow")
                    }
                    .buttonStyle(.borderless)
                }
                VStack(alignment: .leading) {
                    Text("Email Adress:")
                    Text(user.email)
                        .foregroundStyle(.blue)
                }
                
            }
            .padding(.vertical)
            .padding(.leading)
        }
    }
}
