//
//  Game.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

struct Game: Codable {
    let id: Int
    let slug, name: String
    let added: Int?
}
