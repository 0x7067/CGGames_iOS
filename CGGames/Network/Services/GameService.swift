//
//  GameService.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation

class GameService {
    
    let appConfig = AppConfig()
    
    enum ApiError: Error {
        case invalidURL
    }

    func fetchGamePlatforms() async throws -> [GamePlatformResponse] {
        let urlString = "\(AppConfig.BASE_URL)platforms"

        guard let url = getUrlForRequest(urlString, parameters: ["key": appConfig.apiKey]) else {
            throw ApiError.invalidURL
        }

        print(urlString)
        let (data, _) = try await URLSession.shared.data(from: url)

        let response = try JSONDecoder().decode(APIResult.self, from: data)
        return response.results
    }
    
    private func getUrlForRequest(_ url: String, parameters: [String: String]) -> URL? {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        return components.url
    }
}
