//
//  PlacesCustomFlow.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/16/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class PlacesCustomFlow: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        scrollDirection = .horizontal
    }
    

}
