//
//  ListOfUsersViewModel.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 23/05/2024.
//

import SwiftUI

@MainActor
final class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var alertItem: AlertItem?
    
    func getUsers() async throws -> [User] {
        let endpoint = "https://reqres.in/api/use"
        
        guard let url = URL(string: endpoint) else {
            throw ReqResError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ReqResError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let userResponse = try decoder.decode(UserResponse.self, from: data)
            return userResponse.data
        } catch {
            throw ReqResError.invalidData
        }
    }
    
    func getUsers() {
        Task {
            do {
                users = try await getUsers()
            } catch ReqResError.invalidURL {
                print("Invalid URL")
            } catch ReqResError.invalidResponse {
                print("Invalid Response")
            } catch ReqResError.invalidData {
                print("Invalid Data")
            } catch {
                print("Unexpected Error")
            }
        }
    }
}
