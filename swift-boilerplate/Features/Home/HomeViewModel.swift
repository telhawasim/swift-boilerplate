//
//  HomeViewModel.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation

extension HomeView {
    
    @MainActor
    final class ViewModel: ObservableObject {
        
        //MARK: - PROPERTIES -
        
        //Published
        @Published var usersResponse: GetUsersResponse? = nil
        //Normal
        private let repository: any UserRepositoryProtocol
        
        //MARK: - INITIALIZER -
        init(repository: any UserRepositoryProtocol = UserRepository()) {
            self.repository = repository
        }
    }
}

//MARK: - FUNCTIONS -
extension HomeView.ViewModel {
    
    //MARK: - LOAD USERS -
    func loadUsers() async {
        do {
            self.usersResponse = try await repository.fetchUsers()
        } catch {
            print(error.localizedDescription)
        }
    }
}
