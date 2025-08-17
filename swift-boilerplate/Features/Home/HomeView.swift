//
//  HomeView.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - PROEPRTIES -
    
    //StateObject
    @StateObject private var viewModel = HomeView.ViewModel()
    
    //MARK: - VIEWS -
    var body: some View {
        // Main Content
        ScrollView {
            // Users
            VStack(spacing: 16) {
                ForEach(self.viewModel.usersResponse?.users ?? [], id: \.id) { user in
                    HomeUserCard(
                        user: user
                    )
                }
            }
            .padding()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
        .refreshable {
            Task {
                await self.loadUsers()
            }
        }
        .onAppear {
            Task {
                await self.loadUsers()
            }
        }
    }
}

//MARK: - FUNCTIONS -
extension HomeView {
    
    //MARK: - LOAD USERS -
    private func loadUsers() async {
        await self.viewModel.loadUsers()
    }
}

#Preview {
    HomeView()
}
