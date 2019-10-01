//
//  TideStation.swift
//  Burrito
//
//  Created by Brian Green on 9/22/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation
import CoreLocation

class TideStation : Decodable {
    
    var name: String
    var station_id: String
    //var lat: String
    //var lon: String
    
    init( name: String, id: String ) { //}, lat: String, lon:String ) {
        self.name = name
        self.station_id = id
        //self.lat = lat
        //self.lon = lon
    }
    
    /*
    func getLocation() -> CLLocation {
        return CLLocation(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
    }
 */
}
