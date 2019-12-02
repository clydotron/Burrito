//
//  TideStationMapPin.swift
//  Burrito
//
//  Created by Brian Green on 12/1/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import Foundation
import MapKit

class TideStationMapPin : NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title;
        self.coordinate = coordinate;
        
        super.init()
    }
}
