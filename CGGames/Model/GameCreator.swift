//
//  GameCreator.swift
//  CGGames
//
//  Created by Pedro Guimarães on 10/05/22.
//

import Foundation

struct GameCreator: Codable {
    let id: Int
    let name, slug: String
    let image, imageBackground: String
    let gamesCount: Int
    let positions, games: [Game]

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case imageBackground = "image_background"
        case gamesCount = "games_count"
        case positions, games
    }
}
