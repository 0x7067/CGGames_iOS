//
//  Games.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

struct JSONResponse<T: Decodable>: Decodable {
    let count: Int
    let next, previous: String
    let results: [T]
}
