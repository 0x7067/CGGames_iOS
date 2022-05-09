//
//  GameRow.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import SwiftUI

struct GameRowView: View {
    var game: String
        var body: some View {
            HStack {
                Text(verbatim: game)
                Spacer()
            }
        }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(game: "Dark Souls 1")
    }
}
