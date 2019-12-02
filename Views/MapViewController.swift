//
//  MapViewController.swift
//  Burrito
//
//  Created by Brian Green on 12/1/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var tideStations = [TideStation]()
    var stationRepo: TideStationRepo?
    
    var tidePoolRepo: TidePoolRepo?
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add initial location ?
        let initialLocation = CLLocation(latitude: 36.60083333, longitude: -121.88416667)
        
        let regionRadius: CLLocationDistance = 1000000
        //func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
          mapView.setRegion(coordinateRegion, animated: true)
        //}
        
        mapView.delegate = self
        
        if stationRepo == nil {
            stationRepo = TideStationRepo.loadFromJSONFile(fileName: "TideStations.json")
            if let repo = stationRepo {
                tideStations = repo.stations
            }
        }
        
        for station in tideStations {
            mapView.addAnnotation(station)
        }
        
        if tidePoolRepo == nil {
            tidePoolRepo = TidePoolRepo.loadFromJSONFile(fileName: "TidePools.json")
        }
        
        if let repo = tidePoolRepo {
            for tidePool in repo.tidePools {
                mapView.addAnnotation(tidePool)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? TideStation else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x:-5, y:5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
