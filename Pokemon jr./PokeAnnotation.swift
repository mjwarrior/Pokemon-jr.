//
//  PokeAnnotation.swift
//  Pokemon jr.
//
//  Created by Marc Streeter on 5/12/17.
//  Copyright © 2017 Developer Warriors. All rights reserved.
//

import UIKit
import MapKit

class PokeAnnotation : NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    
    
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon) {
      self.coordinate = coord
      self.pokemon = pokemon
    }
    
}
