//
//  CollectionViewCell.swift
//  Movies_APP
//
//  Created by Hany Karam on 5/3/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func configure(movies: Result) {
        
        DispatchQueue.main.async {
            let poster_base_url = "https://image.tmdb.org/t/p/w500"
            if let img = movies.posterPath{
                let posturl = URL(string: poster_base_url +  img )!

                self.img.setImage(imageUrl: posturl)
            }
        }
    }
}
extension UIImageView {
    func setImage(imageUrl: URL){
        self.kf.indicatorType = .activity
        self.kf.setImage(with: imageUrl, placeholder: nil, options: [.transition(.fade(0.7))],   completionHandler: nil)
    }
}
