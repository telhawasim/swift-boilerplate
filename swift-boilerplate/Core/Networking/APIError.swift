//
//  APIError.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case decodingError(any Error)
    case serverError(statusCode: Int, message: String?)
    case networkError(any Error)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .decodingError(let error):
            return "Decoding Error: \(error.localizedDescription)"
        case .serverError(statusCode: let code, message: let message):
            return "Server Error (\(code)): \(message ?? "No message provided")"
        case .networkError(let error):
            return "Network Error: \(error.localizedDescription)"
        case .unknown:
            return "Unknown Error"
        }
    }
}
