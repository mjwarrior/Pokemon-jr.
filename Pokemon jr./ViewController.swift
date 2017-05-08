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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        
    manager.delegate = self
    
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
         print("ready to go ")
         mapView.showsUserLocation = true   
        } else {
           manager.requestWhenInUseAuthorization()
        }
        
        
    
    }

    
    
    
    
    
    

}

