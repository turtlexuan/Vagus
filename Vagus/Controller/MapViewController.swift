//
//  MapViewController.swift
//  Vagus
//
//  Created by 楊信之 on 04/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let locationMG = LocationManager.sharedInstance
        locationMG.requestAlwaysInUse()
        locationMG.start()
        
 //       nowLocation = CLLocation(latitude: getNowLati(), longitude: getNowLogi())
        
        centerMapOnLocation(location: locationMG.locationManager.location!)
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action(_ sender: Any) {
        
        let locationMG = LocationManager.sharedInstance
        
        print(locationMG.getLocation())
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  1000 * 2.0, 1000 * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}

