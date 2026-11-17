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

            Text("Profile coming soon")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.square")
                }
        }
        .tint(Color(red: 15/255, green: 110/255, blue: 86/255))
    }
}

#Preview {
    MainTabView()
}
