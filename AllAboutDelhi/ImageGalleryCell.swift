//
//  ImageGalleryCell.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/5/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class ImageGalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImages: UIImageView!
    
    func configureCell(_ imageId: String){
        self.galleryImages.image = UIImage(named: imageId)
    }
}
