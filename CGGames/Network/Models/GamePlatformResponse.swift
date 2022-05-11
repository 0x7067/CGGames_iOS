//
//  GamePlatform.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

struct APIResult: Codable {
    var results: [GamePlatformResponse]
}

struct GamePlatformResponse: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let games_count: Int
    let image_background: String
    let image: String?
    let year_start: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case games_count
        case image_background
        case image
        case year_start
    }
}
