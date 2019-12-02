//
//  TidePoolRepo.swift
//  Burrito
//
//  Created by Brian Green on 12/1/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation

class TidePoolRepo: Decodable {
    
    var tidePools = [TidePool]()
    
    static func loadFromJSONFile(fileName: String) -> TidePoolRepo? {
        var bundleURL = Bundle.main.bundleURL
        bundleURL.appendPathComponent(fileName)
        do {
            let jsonData = try Data(contentsOf: bundleURL)
            let decoder = JSONDecoder()
            let tidePools = try decoder.decode(TidePoolRepo.self, from: jsonData)
            return tidePools
        } catch let error {
            print("error: \(error.localizedDescription)")
            return nil
        }
    }
}
