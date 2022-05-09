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
            ForEach(viewModel.games) { game in
                GameRowView(game: game.title)
            }
        }.task {
            await viewModel.listGames()
        }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
