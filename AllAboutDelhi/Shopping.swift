//
//  Shopping.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/3/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation

class Shopping {
    
    fileprivate var _address: String!
    fileprivate var _name: String!
    fileprivate var _longitude: Double!
    fileprivate var _latitude: Double!
    fileprivate var _fb: String!
    fileprivate var _url: String!
    fileprivate var _category: String!
    
    var address: String {
        return _address
    }
    
    var name: String {
        return _name
    }
    
    var longitude: Double {
        return _longitude
    }
    
    var latitude: Double {
        return _latitude
    }
    
    var fb: String {
        return _fb
    }
    
    var url: String {
        return _url
    }
    
    var category: String {
        return _category
    }
    
    init(address: String, name: String, longitude: Double, latitude: Double, fb: String, url: String, category: String){
        self._address = address
        self._name = name
        self._longitude = longitude
        self._latitude = latitude
        self._category = category
        self._fb = fb
        self._url = url
    }
    

}
