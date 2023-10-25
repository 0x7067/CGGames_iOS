//
//  GamePlatformsView.swift
//  CGGames
//
//  Created by Pedro Guimarães on 10/05/22.
//

import SwiftUI
import ComposableArchitecture

struct GamePlatformsView: View {
    let store: StoreOf<GameFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List {
                ForEach(viewStore.gamingPlatforms) { platform in
                    GameRowView(platform: platform)
                        .onTapGesture {
                            viewStore.send(.gamePlatformTapped(platform))
                        }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .alert(
              item: viewStore.binding(
                get: { $0.gamingPlatformAlert.map(GamePlatformAlert.init(title:)) },
                send: .gamePlatformAlertDismissed
              ),
              content: { Alert(title: Text($0.title)) }
              )
        }
    }
}

struct GamePlatformAlert: Identifiable {
  var title: String
  var id: String { self.title }
}
