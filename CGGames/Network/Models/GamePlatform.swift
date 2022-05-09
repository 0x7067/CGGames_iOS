//
//  GamePlatform.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

struct APIResult: Codable {
    var results: [GamePlatform]
}

struct GamePlatform : Codable, Identifiable {
    let id : Int
    let name : String
    let slug : String
    let games_count : Int
    let image_background : String
    let image : String?
    let year_start : Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case games_count = "games_count"
        case image_background = "image_background"
        case image = "image"
        case year_start = "year_start"
    }
}
