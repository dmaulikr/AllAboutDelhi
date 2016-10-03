//
//  CafeMapDetailVc.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/31/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class CafeMapDetailVc: UIViewController {

    @IBOutlet weak var cafeDetailMap: MKMapView!
    
    var cafe: Cafe!
    
    var longitude: Double = 0
    var latitude: Double = 0
    var branch = ""
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cafeDetailMap.delegate = self
        
        self.navigationItem.title = cafe.name
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        var location: CLLocationCoordinate2D
        
        for i in 0 ..< cafe.address.count {
            self.latitude = cafe.latitude[i]
            self.longitude = cafe.longitude[i]
            self.branch = cafe.branch[i]
            self.address = cafe.address[i]
            location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            centerMap(location, cafe: cafe)
        }

        
    }
    
    func centerMap(_ location: CLLocationCoordinate2D, cafe: Cafe){
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let region = MKCoordinateRegionMake(location, span)
        cafeDetailMap.setRegion(region, animated: true)
        
        let artwork = Artwork(title: branch, locationName: address, discipline: "chill", coordinate: location)
        cafeDetailMap.addAnnotation(artwork)
    }


}
