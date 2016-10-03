//
//  TopFeed.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/11/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation
import Gloss

public struct TopFeed: Decodable {
    
    let feed: Feed?
    
    public init?(json: JSON) {
        feed = "feed" <~~ json
    }
}