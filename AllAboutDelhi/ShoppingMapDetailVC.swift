//
//  ShoppingMapDetail.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/3/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class ShoppingMapDetailVC: UIViewController {

    @IBOutlet weak var shoppingDetailMap: MKMapView!
    
    var currentShoppingPlace: Shopping!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingDetailMap.delegate = self
        
        self.navigationItem.title = currentShoppingPlace.name
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let location = CLLocationCoordinate2D(latitude: currentShoppingPlace.latitude, longitude: currentShoppingPlace.longitude)
        centerMap(location, place: currentShoppingPlace)
    }
    
    func centerMap(_ location: CLLocationCoordinate2D, place: Shopping){
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location, span)
        shoppingDetailMap.setRegion(region, animated: true)
        
        let artwork = Artwork(title: place.name, locationName: place.address, discipline: "chill", coordinate: location)
        shoppingDetailMap.addAnnotation(artwork)
    }
    

}
