//
//  PlaceAnottaion.swift
//  ticketInPocket
//
//  Created by Parth Patel on 6/6/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {

    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var url: URL?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}
