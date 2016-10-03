//
//  RestaurantMapDetailVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/31/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class RestaurantMapDetailVC: UIViewController {

    @IBOutlet weak var restaurantDetailMap: MKMapView!
    
    var restaurant: Restaurant!
    
    
    var longitude: Double = 0
    var latitude: Double = 0
    var branch = ""
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantDetailMap.delegate = self
        
        self.navigationItem.title = restaurant.name
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        var location: CLLocationCoordinate2D
        
        for i in 0 ..< restaurant.address.count {
            self.latitude = restaurant.latitude[i]
            self.longitude = restaurant.longitude[i]
            self.branch = restaurant.branch[i]
            self.address = restaurant.address[i]
            location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            centerMap(location, res: restaurant)
        }
        
    }

    func centerMap(_ location: CLLocationCoordinate2D, res: Restaurant){
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let region = MKCoordinateRegionMake(location, span)
        restaurantDetailMap.setRegion(region, animated: true)
        
        let artwork = Artwork(title: branch, locationName: address, discipline: "chill", coordinate: location)
        restaurantDetailMap.addAnnotation(artwork)
    }



}
