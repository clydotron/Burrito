//
//  Organism.swift
//  Burrito
//
//  Created by Brian Green on 9/10/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation

class Taxonomy : Decodable {
    var kingdom: String
    var phylum: String
    var tclass: String // can't use class
    var order: String
    var family: String
    var genus: String
    var species: String
}

class Organism : Decodable {
    
    var commonName: String
    var fancyName: String
    var details: String
    var funFacts: String //= [String]()
    var distribution: String
    var habitat: String
    var diet: String
    var taxonomy: String // use the Taxonomy class?
    
}
