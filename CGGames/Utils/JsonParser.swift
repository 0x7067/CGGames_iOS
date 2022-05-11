//
//  FIleUtils.swift
//  CGGames
//
//  Created by Pedro Guimarães on 10/05/22.
//

import Foundation

class JsonParser {
    typealias ResultBlock<T> = (Result<T, Error>) -> Void

    func fetch<T: Decodable>(_ type: T.Type, from data: Data) async throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            // 4
            throw (error)
        }
    }
}
