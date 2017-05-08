//
//  ViewController.swift
//  Pokemon jr.
//
//  Created by Marc Streeter on 5/8/17.
//  Copyright © 2017 Developer Warriors. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    var updateCount = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        
    manager.delegate = self
    
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
         print("ready to go ")
         mapView.showsUserLocation = true
         manager.startUpdatingLocation()
            
        } else {
           manager.requestWhenInUseAuthorization()
        }
        
     
        
        
        
}
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        if updateCount < 3 {
        
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 1000, 1000)
    mapView.setRegion(region, animated: false)
    updateCount += 1
        }
    }
    
    

    
    
    
    
    
    

}

