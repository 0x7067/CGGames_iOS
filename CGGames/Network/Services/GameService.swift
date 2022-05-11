//
//  GameService.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

class GameService {
    enum ApiError: Error {
        case invalidURL
    }

    func fetchGamePlatforms() async throws -> [GamePlatformResponse] {
        let urlString = "\(AppConfig.BASE_URL)platforms?key=\(AppConfig.API_KEY)"

        guard let url = URL(string: urlString) else {
            throw ApiError.invalidURL
        }

        print(urlString)
        let (data, _) = try await URLSession.shared.data(from: url)

        let response = try JSONDecoder().decode(APIResult.self, from: data)
        return response.results
    }
}
