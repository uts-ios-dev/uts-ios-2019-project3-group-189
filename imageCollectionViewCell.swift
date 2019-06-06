//
//  imageCollectionViewCell.swift
//  ticketInPocket
//
//  Created by Parth Patel on 28/5/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import UIKit

class imageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    var event: events? {
        didSet {
            self.updateUI()
        }
    }
    private func updateUI()
    {
        if let event = event {
            image.image = event.images
        } else {
           image.image = nil
            
        }
    }
}
