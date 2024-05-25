//
//  UserModel.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 23/05/2024.
//

import Foundation

struct User: Decodable, Hashable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}

struct UserResponse: Decodable {
    let data: [User]
}


@Observable
final class UserObject: Hashable, Identifiable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    var isFollowed: Bool
    
    init(id: Int, email: String, firstName: String, lastName: String, avatar: String, isFollowed: Bool) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.isFollowed = isFollowed
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
    }
    
    static func == (lhs: UserObject, rhs: UserObject) -> Bool {
        lhs.id == rhs.id
    }
}
