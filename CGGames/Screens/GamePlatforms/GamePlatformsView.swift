//
//  GamePlatformsView.swift
//  CGGames
//
//  Created by Pedro Guimarães on 10/05/22.
//

import SwiftUI

struct GamePlatformsView: View {
    @StateObject private var viewModel = GamesViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.platforms) { platform in
                GameRowView(platform: platform)
            }
        }.task {
            await viewModel.listPlatforms()
        }
    }
}
