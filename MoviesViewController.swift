//
//  MoviesViewController.swift
//  ticketInPocket
//
//  Created by Parth Patel on 4/6/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var movies = [Movies]()
    var image: UIImage!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movies", for: indexPath) as! MovieTableViewCell
        //let movie: Movies
        //movie = movies[indexPath.row]
        //cell.movieName.text = movie.name
        cell.movieImage.image = image
        return cell
    }
    
    func loadimage(name: String, poster: String) {
        let imageURL = URL(string: poster)
        let session = URLSession(configuration: .default)
        self.movies.insert(Movies(name: name, image: poster), at: 0)
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: imageURL!) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        self.image = UIImage(data: imageData)
                        print(self.image!)
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicTask.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        ref = Database.database().reference()
        databaseHandle = ref?.child("Movie").observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as? NSDictionary
            let name1 = snapshotValue!["Name1"] as! String?
            let poster1 = snapshotValue!["Poster1"] as! String?
            self.loadimage(name: name1!, poster: poster1!)
            
            //self.movies.insert(Movies(name: name, image: poster), at: 0)
            //print(self.movies)
            self.tableView.reloadData()
        }) 
    }
}
