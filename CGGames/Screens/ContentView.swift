//
//  ContentView.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import StatefulTabView
import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
        StatefulTabView {
            Tab(title: "Platforms", systemImageName: "gamecontroller") {
                NavigationView {
                    GamePlatformsView(
                        store: Store(initialState: GameFeature.State(gamingPlatforms: [])) {
                        GameFeature()
                      }
                    )
                    .navigationBarTitle("Gaming Platforms")
                }
            }
            Tab(title: "Profile", systemImageName: "person") {
                NavigationView {
                    ProfileView()
                        .navigationBarTitle("Profile")
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
