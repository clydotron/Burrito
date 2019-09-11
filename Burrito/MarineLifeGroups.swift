//
//  MarineLifeGroups.swift
//  Burrito
//
//  Created by Brian Green on 9/6/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation

class MarineLifeGroup: Decodable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Groups: Decodable {
    var allGroups = [MarineLifeGroup]()
    
    static func loadFromJSONFile(fileName: String) -> Groups? {
        var bundleURL = Bundle.main.bundleURL
        bundleURL.appendPathComponent(fileName)
        do {
            let jsonData = try Data(contentsOf: bundleURL)
            let decoder = JSONDecoder()
            let groups = try decoder.decode(Groups.self, from: jsonData)
            return groups
        } catch let error {
            print("error: \(error.localizedDescription)")
            return nil
        }
    }
}
