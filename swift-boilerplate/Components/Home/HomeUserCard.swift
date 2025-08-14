//
//  HomeUserCard.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import SwiftUI

struct HomeUserCard: View {
    
    //MARK: - PROPERTIES -
    
    //State
    @State private var profileImage: UIImage?
    //Normal
    let user: User?
    var onPress: (() -> Void)?
    
    //MARK: - VIEWS -
    var body: some View {
        Button(action: {
            self.onPress?()
        }, label: {
            // Content View
            HStack(spacing: 16) {
                // Show image if not nil, otherwise show loader
                if let image = self.profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 70, height: 70)
                        ProgressView()
                    }
                }
                // Name, Gender and Email
                VStack(alignment: .leading) {
                    // Name
                    Text(self.handleName())
                        .customFont(.poppins, .semibold, .h16)
                        .foregroundStyle(.black)
                    // Gender
                    Text(self.handleGender())
                        .customFont(.poppins, .medium, .h14)
                        .foregroundStyle(Color.gray)
                    // Email
                    Text(verbatim: self.user?.email ?? "")
                        .customFont(.poppins, .medium, .h12)
                        .foregroundStyle(Color.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray)
            )
        })
        .onAppear {
            Task {
                await self.profileImage = try Utils.fetchImage(url: self.user?.image ?? "")
            }
        }
    }
}

//MARK: - FUNCTIONS -
extension HomeUserCard {
    
    //MARK: - HANDLE NAME -
    private func handleName() -> String {
        let firstName = self.user?.firstName ?? ""
        let maidenName = self.user?.maidenName ?? ""
        let lastName = self.user?.lastName ?? ""
        
        return maidenName == "" ? "\(firstName) \(lastName)" : "\(firstName) \(maidenName) \(lastName)"
    }
    
    //MARK: - HANDLE GENDER -
    private func handleGender() -> String {
        let gender = self.user?.gender?.rawValue ?? ""
        
        return gender.prefix(1).uppercased() + gender.dropFirst().lowercased()
    }
}

#Preview {
    HomeUserCard(
        user: User(
            firstName: "Telha",
            lastName: "Khan", 
            maidenName: "Wasim",
            gender: Gender.female,
            email: "telhawasim@gmail.com",
            image: "https://dummyjson.com/icon/emilys/128"
        )
    )
}
