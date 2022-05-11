//
//  ContentView.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GamePlatformsView()
                .tabItem {
                    Label("Platforms", systemImage: "gamecontroller")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
