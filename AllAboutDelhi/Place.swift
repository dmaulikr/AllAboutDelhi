//
//  Place.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/23/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation

class Place {
    
    fileprivate var _name: String!
    fileprivate var _address: String!
    fileprivate var _latitude: Double!
    fileprivate var _longitude: Double!
    fileprivate var _price: String!
    fileprivate var _trainStation: String!
    fileprivate var _hours: String!
    fileprivate var _about: String!
    fileprivate var _source: String!
    
    
    var name: String {
        return _name
    }
    
    var address: String {
        return _address
    }
    
    var latitude: Double {
        return _latitude
    }
    
    var longitude: Double {
        return _longitude
    }
    
    var price: String {
        return _price
    }
    
    var trainStation: String {
        return _trainStation
    }
    
    var hours: String {
        return _hours
    }
    
    var about: String {
        return _about
    }
    
    var source: String {
        return _source
    }
    
    init(name: String, address: String, latitude: Double, longitude: Double, price: String, trainStation: String, hours: String, about: String, source: String){
        self._name = name
        self._address = address
        self._latitude = latitude
        self._longitude = longitude
        self._price = price
        self._trainStation = trainStation
        self._hours = hours
        self._about = about
        self._source = source
    }
}
