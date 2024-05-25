//
//  ListOfUsersViewModel.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 23/05/2024.
//

import SwiftUI

@Observable
final class UserViewModel {
    
    var users: [UserObject] = []
    var alertItem: AlertItem?
    var isLoading = false
    
    func getUsers() {
        isLoading = true
        
        Task {
            defer {
                isLoading = false
            }
            do {
                let fetchedUsers = try await NetworkManager.shared.getUsers()
                users = convertUsers(fetchedUsers)
            } catch {
                if let userError = error as? GetUserError {
                    switch userError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
            }
        }
    }
    
    func convertUsers(_ anArray: [User]) -> [UserObject] {
        var newArray = [UserObject]()
        anArray.forEach { user in
            let newUserObject = UserObject(
                id: user.id,
                email: user.email,
                firstName: user.firstName,
                lastName: user.lastName,
                avatar: user.avatar,
                isFollowed: false
            )
            newArray.append(newUserObject)
        }
        return newArray
    }
}
