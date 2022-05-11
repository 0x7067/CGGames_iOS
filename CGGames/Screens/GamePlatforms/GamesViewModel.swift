//
//  GamesViewModel.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

@MainActor
class GamesViewModel: ObservableObject {
    let gameService = GameService()

    enum State {
        case loading
        case success(data: [GamePlatform])
        case error(message: String)
    }

    @Published var state: State = .loading

    func requestPlatforms() async {
        do {
            let response = try await gameService.fetchGamePlatforms()
            let result = response.map { gamePlatformResponse in
                GamePlatform(id: gamePlatformResponse.id, name: gamePlatformResponse.name, gameCount: gamePlatformResponse.games_count)
            }
            state = .success(data: result)
        } catch {
            state = .error(message: error.localizedDescription)
        }
    }
}
