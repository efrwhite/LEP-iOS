//
//  MainTabView.swift
//  LEP IOS
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            FilterView()
                .tabItem {
                    Label("History", systemImage: "folder")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.square")
                }
        }
        .tint(primaryGreen)
    }
}

#Preview {
    MainTabView()
}
