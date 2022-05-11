//
//  ProfileViewModel.swift
//  CGGames
//
//  Created by Pedro Guimarães on 10/05/22.
//

import Foundation
import UniformTypeIdentifiers

@MainActor
class ProfileViewModel: ObservableObject {
    let jsonParser = JsonParser()

    @Published var creator = GameCreator()

    func getCreatorProfile() async {
        let url = Bundle.main.url(forResource: "GabeNewell", withExtension: "json")!
        let fileData = try! Data(contentsOf: url)
        do {
            let result = try await jsonParser.fetch(GameCreator.self, from: fileData)
            creator = result
        } catch {
            print(error)
        }
    }
}
