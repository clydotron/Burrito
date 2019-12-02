//
//  TideStation.swift
//  Burrito
//
//  Created by Brian Green on 9/22/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class TideStation : NSObject, Decodable {
    

    var name: String
    var station_id: String
    var lat: Double
    var lon: Double
    
    init( name: String, id: String, lat: Double, lon:Double ) {
        self.name = name
        self.station_id = id
        self.lat = lat
        self.lon = lon
    }
    
    
    
    /*
    func getLocation() -> CLLocation {
        return CLLocation(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
    }
 */
}

extension TideStation : MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    var title: String? {
        return name
    }
    
    var subtitle: String? {
        return station_id
    }
    
}
