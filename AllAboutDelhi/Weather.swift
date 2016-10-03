//
//  Weather.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/4/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation
import Alamofire


class Weather {
    
    fileprivate var _currentTemp: String!
    fileprivate var _currentHumidity: String!
    fileprivate var _minimumTemp: String!
    fileprivate var _maximumTemp: String!
    fileprivate var _windSpeed: String!
    fileprivate var _tempDesc: String!
    fileprivate var _currentLocation: String!
    fileprivate var _sunriseTime: String!
    fileprivate var _sunsetTime: String!
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
        return _currentTemp
    }
    
    var currentHumidity: String {
        if _currentHumidity == nil {
            _currentHumidity = ""
        }

        return _currentHumidity
    }
    
    var minimumTemp: String {
        if _minimumTemp == nil {
            _minimumTemp = ""
        }

        return _minimumTemp
    }
    
    var maximumTemp: String {
        if _maximumTemp == nil {
            _maximumTemp = ""
        }

        return _maximumTemp
    }
    
    var windSpeed: String {
        if _windSpeed == nil {
            _windSpeed = ""
        }

        return _windSpeed
    }
    
    var tempDesc: String {
        if _tempDesc == nil {
            _tempDesc = ""
        }

        return _tempDesc
    }
    
    var currentLocation: String {
        if _currentLocation == nil {
            _currentLocation = ""
        }

        return _currentLocation
    }
    
    var sunriseTime: String {
        if _sunriseTime == nil {
            _sunriseTime = ""
        }

        return _sunriseTime
    }
    
    var sunsetTime: String {
        if _sunsetTime == nil {
            _sunsetTime = ""
        }

        return _sunsetTime
    }
    
    init(){
        
    }
    
    func localTimeConversion(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    func downloadWeatherDetails(_ completed: @escaping DownloadComplete){
        let url = URL(string: "\(URL_BASE)\(TEMP_UNIT)&APPID=\(API_KEY)")!
        Alamofire.request(url).responseJSON { (response) -> Void in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let tempDetail = dict["main"] as? Dictionary<String,AnyObject> {
                    if let currentTemp = tempDetail["temp"] as? Int {
                        self._currentTemp = "\(currentTemp)"
                    }
                    
                }
                
                if let humidityDetail = dict["main"] as? Dictionary<String,AnyObject> {
                    if let humidity = humidityDetail["humidity"] as? Int {
                        self._currentHumidity = "\(humidity)"
                    }
                }
                
                if let location = dict["name"] as? String {
                    self._currentLocation = location
                }
                
                if let conditionDetail = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let condition = conditionDetail[0]["description"] as? String {
                        self._tempDesc = condition.capitalized
                    }
                }
                
                if let windDetail = dict["wind"] as? Dictionary<String, AnyObject> {
                    if let speed = windDetail["speed"] as? Int{
                        self._windSpeed = "\(speed)"
                    }
                }
                
                if let sunriseDetail = dict["sys"] as? Dictionary<String,AnyObject> {
                    if let sunrise = sunriseDetail["sunrise"] as? Double {
                        self._sunriseTime = self.localTimeConversion(sunrise)
                    }
                }
                
                if let sunsetDetail = dict["sys"] as? Dictionary<String, AnyObject> {
                    if let sunset = sunsetDetail["sunset"] as? Double {
                        self._sunsetTime = self.localTimeConversion(sunset)
                    }
                }
                
                if let minTempDetail = dict["main"] as? Dictionary<String, AnyObject> {
                    if let minTemp = minTempDetail["temp_min"] as? Int {
                        self._minimumTemp = "\(minTemp)"
                    }
                }
                
                if let maxTempDetail = dict["main"] as? Dictionary<String, AnyObject> {
                    if let maxTemp = maxTempDetail["temp_max"] as? Int {
                        self._maximumTemp = "\(maxTemp)"
                    }
                }
            }
            
            completed()
            
        }
    }
    
    
}
