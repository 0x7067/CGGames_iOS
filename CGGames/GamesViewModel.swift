//
//  GamesViewModel.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

@MainActor
class GamesViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    @MainActor
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
}
