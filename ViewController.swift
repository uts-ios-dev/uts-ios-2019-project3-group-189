//
//  ViewController.swift
//  ticketInPocket
//
//  Created by Parth Patel on 17/5/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var event = events.fetchimage()
    var eventImages = [UIImage(named: "Aladdin_TOS_FB_800x800"), UIImage(named: "Spectacular Sydney Showboats Harbour Dinner Cruise"), UIImage(named: "NRL Panthers Home Game"), UIImage(named: "Khalid_FreeSpiritTour-Frontier(Square-475x475)_ART")]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        //searchBar.layer.borderWidth = 0
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "successfulLogin", sender: self)
        }*/
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return event.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "Images", for: indexPath) as! imageCollectionViewCell
        cell.event = event[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        destinationViewController.image = eventImages[indexPath.item]!
        self.navigationController?.pushViewController(destinationViewController, animated: true)
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
}
