//
//  WeatherVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/4/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var tempDescLbl: UILabel!
    @IBOutlet weak var locationImg: UIImageView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var windSpeedImg: UIImageView!
    @IBOutlet weak var windSpeedlbl: UILabel!
    @IBOutlet weak var humidityImg: UIImageView!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var sunriseImg: UIImageView!
    @IBOutlet weak var sunsetImg: UIImageView!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var currentConditionImg: UIImageView!
    @IBOutlet weak var minTempImg: UIImageView!
    @IBOutlet weak var minTempLbl: UILabel!
    @IBOutlet weak var maxTempImg: UIImageView!
    @IBOutlet weak var maxTempLbl: UILabel!
    
    @IBAction func backBtnPressed(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    var weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.title = "Weather"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    
        weather.downloadWeatherDetails { () -> () in
            self.updateUI()
        }
    }
    
    func updateUI(){
        currentTempLbl.text = "\(weather.currentTemp)°F"
        tempDescLbl.text = weather.tempDesc
        currentConditionImg.image = UIImage(named: "\(weather.tempDesc).png")
        locationLbl.text = weather.currentLocation
        humidityLbl.text = "\(weather.currentHumidity)%"
        windSpeedlbl.text = "\(weather.windSpeed)mph"
        sunriseLbl.text = weather.sunriseTime
        sunsetLbl.text = weather.sunsetTime
        maxTempLbl.text = "\(weather.maximumTemp)°F"
        minTempLbl.text = "\(weather.minimumTemp)°F"
    }

}
