//
//  AttractionMapDetailVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/25/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class AttractionMapDetailVC: UIViewController {
    
    @IBOutlet weak var detailMapView: MKMapView!

    var place:Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailMapView.delegate = self
        let location = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
        
        centerMap(location, place: place)
        
        navigationItem.title = place.name
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    func centerMap(_ location: CLLocationCoordinate2D, place: Place){
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        detailMapView.setRegion(region, animated: true)
        
        let artwork = Artwork(title: place.name, locationName: place.address, discipline: "Monument", coordinate: location)
        detailMapView.addAnnotation(artwork)

    }


}
