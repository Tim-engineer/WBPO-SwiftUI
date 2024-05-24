//
//  UserModel.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 23/05/2024.
//

import Foundation

struct User: Codable, Hashable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
}

struct UserResponse: Codable {
    let data: [User]
}
