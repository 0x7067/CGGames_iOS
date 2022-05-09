//
//  ContentView.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GamesViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.platforms) { platform in
                GameRowView(game: platform.name)
            }
        }.task {
            await viewModel.listPlatforms()
        }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
