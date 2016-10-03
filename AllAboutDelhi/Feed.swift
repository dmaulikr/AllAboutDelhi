//
//  Feed.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/11/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation
import Gloss

public struct Feed: Decodable {
    
    let places: [Dictionary<String,AnyObject>]?
    
    let bars: [Dictionary<String, AnyObject>]?
    
    let restaurants: [Dictionary<String, AnyObject>]?
    
    let cafe: [Dictionary<String, AnyObject>]?
    
    let shopping: [Dictionary<String, AnyObject>]?
    
    public init?(json: JSON) {
        
        places = "places" <~~ json

        bars = "bars" <~~ json

        restaurants = "restaurants" <~~ json
        
        cafe = "cafe" <~~ json
        
        shopping = "shopping" <~~ json
        
    }
}
