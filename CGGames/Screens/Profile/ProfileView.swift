//
//  ProfileView.swift
//  CGGames
//
//  Created by Pedro Guimarães on 10/05/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        ScrollView {
            Header(creator: viewModel.creator).task {
                await viewModel.getCreatorProfile()
            }
        }
    }
}

struct Header: View {
    let creator: GameCreator
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: creator.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                },
                placeholder: {
                    ProgressView()
                }
            ).clipShape(Circle())
            Text(creator.name).bold()
        }
    }
}
