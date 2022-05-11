//
//  Config.swift
//  CGGames
//
//  Created by Pedro Guimarães on 09/05/22.
//

import Foundation
class AppConfig {
    static let BASE_URL = "https://api.rawg.io/api/"
    
    var apiKey: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "Rawg-Info", ofType: "plist") else {
          fatalError("Couldn't find file 'Rawg-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'Rawg-Info.plist'.")
        }
        return value
      }
    }

}
