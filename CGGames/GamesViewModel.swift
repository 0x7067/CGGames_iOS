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
    
    func listGames() async {
        guard let data = try?  await  requestGames() else {
            self.games = []
            return
        }
        
        self.games = data
    }
    
    func requestGames() async throws -> [Game] {
        return [Game(title: "Dark Souls 1"),Game(title: "Dark Souls 2"),Game(title: "Dark Souls 3")]
    }
    
    func listPlatforms() async {
        guard let data = try?  await  requestPlatforms() else {
            self.platforms = []
            return
        }
        
        self.platforms = data
    }
    
    func requestPlatforms() async throws -> [GamePlatform] {
        do {
            return try await gameService.fetchGamePlatforms()
        } catch {
            print("Fetching platforms failed with error \(error)")
        }
        return []
    }
}
