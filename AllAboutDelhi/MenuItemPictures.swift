//
//  MenuItemPictures.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/6/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class MenuItemPictures: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = (UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor)
    }

}
