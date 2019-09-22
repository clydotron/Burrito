//
//  OrganismRepo.swift
//  Burrito
//
//  Created by Brian Green on 9/10/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation

class OrganismRepo: Decodable {
    //var organisms = [Organism]()
    var groups = [OrganismGroup]()
    
    static func loadFromJSONFile(fileName: String) -> OrganismRepo? {
        var bundleURL = Bundle.main.bundleURL
        bundleURL.appendPathComponent(fileName)
        do {
            let jsonData = try Data(contentsOf: bundleURL)
            let decoder = JSONDecoder()
            let organisms = try decoder.decode(OrganismRepo.self, from: jsonData)
            return organisms
        } catch let error {
            print("error: \(error.localizedDescription)")
            return nil
        }
    }
}
