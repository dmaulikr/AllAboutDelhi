//
//  MenuItemsBgView.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/8/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import Gloss

class MenuItemsBgView: UIView {

    
    override func awakeFromNib() {
        
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = (UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor)
    }

}
