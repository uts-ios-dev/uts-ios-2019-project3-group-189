//
//  events.swift
//  ticketInPocket
//
//  Created by Parth Patel on 28/5/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import UIKit

class events {
    var images: UIImage
    init(images: UIImage) {
        self.images = images
    }
    
    static func fetchimage() -> [events] {
        return [
            events(images: UIImage(named: "Aladdin_TOS_FB_800x800")!),
            events(images: UIImage(named: "Spectacular Sydney Showboats Harbour Dinner Cruise")!),
            events(images: UIImage(named: "NRL Panthers Home Game")!),
            events(images: UIImage(named: "Khalid_FreeSpiritTour-Frontier(Square-475x475)_ART")!)
        ]
    }

}
