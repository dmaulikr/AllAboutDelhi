//
//  Cafe.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/31/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation

class Cafe {
    
    fileprivate var _name: String!
    fileprivate var _url: String!
    fileprivate var _fb: String!
    fileprivate var _category: String!
    fileprivate var _address: [String] = []
    fileprivate var _branch: [String] = []
    fileprivate var _longitude: [Double] = []
    fileprivate var _latitude: [Double] = []
    
    var name: String {
        return _name
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
    
    var address: [String] {
        return _address
    }
    
    var branch: [String] {
        return _branch
    }
    
    var longitude: [Double] {
        return _longitude
    }
    
    var latitude: [Double] {
        return _latitude
    }
    
    
    init(name: String, fb: String, url: String, category: String, address: [String], branch: [String], longitude: [Double], latitude: [Double]){
        self._name = name
        self._fb = fb
        self._url = url
        self._category = category
        self._address = address
        self._branch = branch
        self._longitude = longitude
        self._latitude = latitude
    }
    

    func emptyArray(){
        self._address = []
    }
    
    
}
