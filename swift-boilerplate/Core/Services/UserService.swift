//
//  UserService.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

enum UserEndpoints: Endpoint {
    
    case allUsers
    
    //MARK: - PATH -
    var path: String {
        switch self {
        case .allUsers:
            return "users"
        }
    }
    
    //MARK: - METHOD -
    var method: HTTPMethod {
        switch self {
        case .allUsers:
            return .GET
        }
    }
}
