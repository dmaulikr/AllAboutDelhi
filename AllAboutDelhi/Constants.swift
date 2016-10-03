//
//  Constants.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/5/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation

let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?q=Delhi"
let TEMP_UNIT = "&units=imperial"
let API_KEY = "9cce2bfce97d8f295325558a489388eb"

typealias DownloadComplete = () -> ()
typealias jsonParsingCompleted = () -> ()
