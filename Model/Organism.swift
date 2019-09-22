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
    var description: String
    var funFacts: String
    var distribution: String
    
    
    
    init(   commonName: String,
            fancyName: String,
            description: String,
            funFacts: String,
            distribution: String
            ) {
        
        self.commonName = commonName
        self.fancyName = fancyName
        self.description = description
        self.funFacts = funFacts
        self.distribution = distribution
    }
    /*
    var description: String
    var funFacts: String //= [String]()
    var distribution: String
    var habitat: String
    var diet: String
    var taxonomy: String // use the Taxonomy class?
    var key: String
 */
}

/*
 //JSON sample
"description": "words",
"funFacts": "facts",
"distribution":"CA"
"habitat": "sea",
"diet": "food",
"taxonomy": "KFCOFGS",
"key":"key"
*/

/*
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *commonName;
@property (nonatomic, retain) NSString *groupName;
@property (nonatomic, retain) NSString *scientificName;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *distribution;
@property (nonatomic, retain) NSString *taxonomy;
@property (nonatomic, retain) NSString *habitat;
@property (nonatomic, retain) NSString *diet;
@property (nonatomic, retain) NSString *funFacts;
@property (nonatomic, readonly) UIImage *thumbnail;
@property (nonatomic, readonly) NSMutableArray* images;
*/
