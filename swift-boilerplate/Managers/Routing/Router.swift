//
//  Router.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    
    //MARK: - PROPERTIES -
    
    //Published
    @Published var route: [Route] = []
    
    //MARK: - PUSH -
    func push(to route: Route) {
        self.route.append(route)
    }
    
    //MARK: - POP -
    func pop() {
        self.route.removeLast()
    }
    
    //MARK: - NAVIGATION DESTINATION -
    @ViewBuilder
    func navigationDestination(_ route: Route) -> some View {
        switch route {
        case .tabbar:
            TabbarView()
        }
    }
}
