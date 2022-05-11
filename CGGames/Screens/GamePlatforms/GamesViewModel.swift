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

    @Published var games: [Game] = []
    @Published var platforms: [GamePlatform] = []

    func listPlatforms() async {
        guard let data = try? await requestPlatforms() else {
            platforms = []
            return
        }

        platforms = data
    }

    func requestPlatforms() async throws -> [GamePlatform] {
        do {
            let response = try await gameService.fetchGamePlatforms()
            return response.map { gamePlatformResponse in
                GamePlatform(id: gamePlatformResponse.id, name: gamePlatformResponse.name, gameCount: gamePlatformResponse.games_count)
            }
        } catch {
            print("Fetching platforms failed with error \(error)")
        }
        return []
    }
}
