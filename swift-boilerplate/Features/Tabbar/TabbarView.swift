//
//  TabbarView.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import SwiftUI

struct TabbarView: View {
    
    //MARK: - PROPERTIES -
    
    @State private var selectedTab = TabbarType.home
    
    //MARK: - VIEWS -
    var body: some View {
        TabView(selection: self.$selectedTab) {
            Tab("Home", systemImage: "house", value: TabbarType.home) {
                HomeView()
            }
            Tab("Settings", systemImage: "gear", value: TabbarType.settings) {
                SettingsView()
            }
        }
    }
}

#Preview {
    TabbarView()
}
