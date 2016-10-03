//
//  AboutVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/17/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var placeDetailImg: UIImageView!
    @IBOutlet weak var placeDetailHoursLbl: UILabel!
    @IBOutlet weak var placeDetailPricesLbl: UILabel!
    @IBOutlet weak var placeDetailAddressLbl: UILabel!
    @IBOutlet weak var placeDetailTrainStationLbl: UILabel!
    @IBOutlet weak var placeDetailDescLbl: UILabel!
    
    var place:Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = place.name
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        updateUI()
        
    }
    
    func updateUI() {
        placeDetailImg.image = UIImage(named: place.name)
        placeDetailImg.clipsToBounds = true 
        placeDetailAddressLbl.text = place.address
        placeDetailHoursLbl.text = place.hours
        placeDetailTrainStationLbl.text = place.trainStation
        placeDetailDescLbl.text = place.about
        placeDetailPricesLbl.text = place.price
        
    }

}
