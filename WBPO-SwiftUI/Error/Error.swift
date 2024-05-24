//
//  Error.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 23/05/2024.
//

import Foundation

enum ReqResError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
