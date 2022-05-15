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
        case invalidResponse(message: String)
    }
    
    enum ApiPath {
        case platforms
        case creators
    }

    func fetchGamePlatforms() async throws -> [GamePlatformResponse] {
        let urlString = "\(AppConfig.BASE_URL)\(getApiPath(.platforms))"

        guard let url = getUrlForRequest(urlString, parameters: ["key": appConfig.apiKey]) else {
            throw ApiError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw ApiError.invalidResponse(message: httpResponse.statusCode.description)
        } else {
            return try JSONDecoder().decode(APIResult.self, from: data).results
        }
    }
    
    func getGameCreators() {
        let urlString = "\(AppConfig.BASE_URL)\(getApiPath(.creators))"
        // Rest of the function
    }

    private func getUrlForRequest(_ url: String, parameters: [String: String]) -> URL? {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        return components.url
    }
    
    private func getApiPath(_ path: ApiPath) -> String {
        switch (path) {
        case .platforms:
            return "platforms"
        case .creators:
            return "creators"
        }
    }
}
