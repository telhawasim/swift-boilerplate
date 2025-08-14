//
//  UserRepository.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

protocol UserRepositoryProtocol: Sendable {
    
    func fetchUsers() async throws -> GetUsersResponse?
}

final class UserRepository: UserRepositoryProtocol {
    
    //MARK: - PROPERTIES -
    private let client: any NetworkClientProtocol
    
    //MARK: - INITIALIZER -
    init(client: any NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }
    
    //MARK: - FETCH USERS -
    func fetchUsers() async throws -> GetUsersResponse? {
        try await self.client.request(UserEndpoints.allUsers)
    }
}
