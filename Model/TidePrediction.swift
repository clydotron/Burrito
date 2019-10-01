//
//  TidePrediction.swift
//  Burrito
//
//  Created by Brian Green on 9/22/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation

class TidePrediction : Decodable {
    
    var t: String
    var v: String
    var type: String
    
}

class TideInfo : Decodable {
    var predictions = [TidePrediction]()
}
