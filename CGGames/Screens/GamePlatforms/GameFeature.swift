//
//  GameFeature.swift
//  CGGames
//
//  Created by Pedro Guimarães on 25/10/23.
//

import Foundation
import ComposableArchitecture

struct GameFeature: Reducer {
    let gameService = GameService()

    struct State: Equatable {
        var gamingPlatforms: [GamePlatform]
        var gamingPlatformAlert: String?
    }

    enum Action: Equatable {
        case gamePlatformsResponse([GamePlatform])
        case gamePlatformTapped(GamePlatform)
        case onAppear
        case gamePlatformAlertDismissed
    }

    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .gamePlatformsResponse(let array):
            state.gamingPlatforms = array
            return .none

        case .onAppear:
            return .run { send in
                let response = try await gameService.fetchGamePlatforms()
                let result = response.map { gamePlatformResponse in
                    GamePlatform(id: gamePlatformResponse.id, name: gamePlatformResponse.name, gameCount: gamePlatformResponse.games_count)
                }
                await send(.gamePlatformsResponse(result))
            }

        case .gamePlatformTapped(let platform):
            state.gamingPlatformAlert = platform.name
            return .none

        case .gamePlatformAlertDismissed:
            state.gamingPlatformAlert = nil
            return .none
        }
    }
}
