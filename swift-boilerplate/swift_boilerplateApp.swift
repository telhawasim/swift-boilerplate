//
//  swift_boilerplateApp.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import SwiftUI

@main
struct swift_boilerplateApp: App {
    
    //MARK: - PROPERTIES -
    
    //StateObject
    @StateObject private var router: Router = Router()
    
    //MARK: - LIFECYCLE -
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: self.$router.route) {
                TabbarView()
                    .navigationDestination(for: Route.self) { route in
                        self.router.navigationDestination(route)
                    }
            }
            .environmentObject(self.router)
        }
    }
}
