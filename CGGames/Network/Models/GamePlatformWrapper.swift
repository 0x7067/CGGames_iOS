//
//  GamePlatformWrapper.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

struct GamePlatformWrapper: Codable {
    let next, previous: String
    let results: [GamePlatform]
}
