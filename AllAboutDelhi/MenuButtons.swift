//
//  MenuButtons.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/11/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class MenuButtons: UIButton {

    override func awakeFromNib() {
        
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        
    }

}
