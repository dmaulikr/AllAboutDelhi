//
//  PlaceCell.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/12/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class PlaceCell: UICollectionViewCell {
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var placeMapView: MKMapView!
    @IBOutlet weak var sourceBtn: UIButton!
    @IBOutlet weak var attractionImg: UIImageView!
    
    var url = ""
    
    @IBAction func sourbeBtnTapped(_ sender: UIButton){

        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    func configureCell(_ place: Place){
        
        let allAnnotations = self.placeMapView.annotations
        placeMapView.removeAnnotations(allAnnotations)

        self.attractionImg.image = UIImage(named: place.name)
        self.attractionImg.clipsToBounds = true
        
        if place.source.contains("delhitourism") {
            self.url = place.source
            self.sourceBtn.setTitle("DelhiTourism", for: UIControlState())
        }
        
        self.placeNameLbl.text = place.name
        self.addressLbl.text = place.address
        self.overviewLbl.text = place.about

        let location = CLLocationCoordinate2D(
            latitude: place.latitude,
            longitude: place.longitude
        )
        
        centerMapOnLocation(location,place: place)


    }
    
    func centerMapOnLocation(_ location: CLLocationCoordinate2D,place: Place){

        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        let artwork = Artwork(title: place.name, locationName: "Monument", discipline: "scul", coordinate: location)
        placeMapView.setRegion(region, animated: true)
        placeMapView.addAnnotation(artwork)
        
    }
        
}
