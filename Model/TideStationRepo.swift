//
//  TideStationRepo.swift
//  Burrito
//
//  Created by Brian Green on 9/22/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation

class TideStationRepo: Decodable {
    
    var stations = [TideStation]()
    
    static func loadFromJSONFile(fileName: String) -> TideStationRepo? {
        var bundleURL = Bundle.main.bundleURL
        bundleURL.appendPathComponent(fileName)
        do {
            let jsonData = try Data(contentsOf: bundleURL)
            let decoder = JSONDecoder()
            let stations = try decoder.decode(TideStationRepo.self, from: jsonData)
            return stations
        } catch let error {
            print("error: \(error.localizedDescription)")
            return nil
        }
    }
}
