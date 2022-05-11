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
        switch viewModel.state {
        case .loading:
            ProgressView().onAppear().task {
                await viewModel.requestPlatforms()
            }
        case .error:
            Text("Something wrong happened")
        case let .success(data: data):
            List {
                ForEach(data) { platform in
                    GameRowView(platform: platform)
                }
            }.refreshable {
                await viewModel.requestPlatforms()
            }
        }
    }
}
