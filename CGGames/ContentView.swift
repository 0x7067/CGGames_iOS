//
//  ContentView.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import SwiftUI
import StatefulTabView

struct ContentView: View {
    var body: some View {
        StatefulTabView {
            Tab(title: "Platforms", systemImageName: "gamecontroller") {
                NavigationView {
                    GamePlatformsView()
                    .navigationBarTitle("Gaming Platforms")
                }
            }
            Tab(title: "Profile", systemImageName: "person") {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
            }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
