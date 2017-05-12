//
//  ViewController.swift
//  Pokemon jr.
//
//  Created by Marc Streeter on 5/8/17.
//  Copyright © 2017 Developer Warriors. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    var updateCount = 0
    
    var pokemons : [Pokemon] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemons = getAllPokemon()
        
    manager.delegate = self
    
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
        mapView.delegate = self
        
            
         mapView.showsUserLocation = true
         manager.startUpdatingLocation()
         Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
            //Spawn a pokemon 
            if let coord = self.manager.location?.coordinate {
            let anno = MKPointAnnotation()
            anno.coordinate = coord
            let randoLat = (Double(arc4random_uniform(200)) - 100.0)  / 50000.0
            let randoLon = (Double(arc4random_uniform(200)) - 100.0)  / 50000.0
                anno.coordinate.latitude += randoLat
                anno.coordinate.longitude += randoLon
               self.mapView.addAnnotation(anno)
            }
            })
        } else {
           manager.requestWhenInUseAuthorization()
        }
        
     
        
        
        
}
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        if annotation is MKUserLocation {
            let annoView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
            
            annoView.image = UIImage(named: "player")
            
            var frame = annoView.frame
            frame.size.height = 50
            frame.size.width = 50
            annoView.frame = frame
            
            
            return annoView
  
        }
        
        let annoView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        annoView.image = UIImage(named: "charmander")
        
        var frame = annoView.frame
        frame.size.height = 50
        frame.size.width = 50
        annoView.frame = frame
        
        
        return annoView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        if updateCount < 3 {
        
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 200, 200)
    mapView.setRegion(region, animated: false)
    updateCount += 1
        } else {
        manager.stopUpdatingLocation()
            
        
        }
    }
    
    

    @IBAction func centerTapped(_ sender: Any) {
        if let coord = manager.location?.coordinate {
        let region = MKCoordinateRegionMakeWithDistance(coord, 200, 200)
        mapView.setRegion(region, animated: true)

    }
    }
    
    
    
    
    

}

