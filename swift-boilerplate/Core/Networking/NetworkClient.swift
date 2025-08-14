//
//  NetworkClient.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation

protocol NetworkClientProtocol: Sendable {
    func request<T: Decodable>(_ endpoint: any Endpoint) async throws -> T
}

final class NetworkClient: NetworkClientProtocol {
    private let config: NetworkConfig
    private let urlSession: URLSession

    init(config: NetworkConfig = .default, urlSession: URLSession = .shared) {
        self.config = config
        self.urlSession = urlSession
    }

    func request<T: Decodable>(_ endpoint: any Endpoint) async throws -> T {
        guard var urlComponents = URLComponents(url: config.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false) else {
            throw APIError.invalidURL
        }

        urlComponents.queryItems = endpoint.queryItems

        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body

        config.headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        do {
            let (data, response) = try await urlSession.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.unknown
            }

            if !(200...299).contains(httpResponse.statusCode) {
                let message = String(data: data, encoding: .utf8)
                throw APIError.serverError(statusCode: httpResponse.statusCode, message: message)
            }

            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.decodingError(error)
            }

        } catch {
            throw APIError.networkError(error)
        }
    }
}
