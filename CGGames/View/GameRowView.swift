//
//  GameRow.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import SwiftUI

struct GameRowView: View {
    var platform: GamePlatform
    var body: some View {
        VStack(alignment: .leading) {
            Text(platform.name)
                .font(.headline)
            Text("\(platform.gameCount) games available")
                .font(.subheadline)
        }
    }
}

// struct GameRow_Previews: PreviewProvider {
//    static var previews: some View {
//        GameRowView(game: "Dark Souls 1")
//    }
// }
