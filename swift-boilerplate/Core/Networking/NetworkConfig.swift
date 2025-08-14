//
//  NetworkConfig.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation

struct NetworkConfig {
    
    let baseURL: URL
    let headers: [String: String]
    
    static let `default` = NetworkConfig(
        baseURL: URL(string: "https://dummyjson.com/")!,
        headers: [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    )
}
