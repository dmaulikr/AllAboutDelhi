//
//  BarMapDetailVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/30/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class BarMapDetailVC: UIViewController {

    @IBOutlet weak var barDetailMap: MKMapView!
    
    var currentBar: Bars!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barDetailMap.delegate = self
        
        navigationItem.title = currentBar.name
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let location = CLLocationCoordinate2D(latitude: currentBar.latitude, longitude: currentBar.longitude)
        centerMap(location, bar: currentBar)
    }
    
    func centerMap(_ location: CLLocationCoordinate2D, bar: Bars){
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location, span)
        barDetailMap.setRegion(region, animated: true)
        
        let artwork = Artwork(title: bar.name, locationName: bar.address, discipline: "chill", coordinate: location)
        barDetailMap.addAnnotation(artwork)
    }



}
