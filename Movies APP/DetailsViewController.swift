//
//  DetailsViewController.swift
//  Movies APP
//
//  Created by Ahmed Saeed on 9/21/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie : Result?
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var poster: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let poster_base_url = "https://image.tmdb.org/t/p/w500"
        let img = movie?.posterPath
        let posterURL = URL(string: poster_base_url + img!)
        self.desc.text = movie?.overview
        self.poster.setImage(imageUrl: posterURL!)
    }

    
    
    
    
}
