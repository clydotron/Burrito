//
//  TidePool.swift
//  Burrito
//
//  Created by Brian Green on 12/1/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation
import MapKit

class TidePool : NSObject, Decodable {
    
    var title: String?
    var details: String
    var lat: Double
    var lon: Double
    
    init( title: String, details: String, lat: Double, lon:Double ) {
        self.title = title
        self.details = details
        self.lat = lat
        self.lon = lon
    }
}

extension TidePool : MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }

    var subtitle: String? {
        return details
    }
    
}
