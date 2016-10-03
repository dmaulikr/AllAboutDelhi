//
//  ShoppingCell.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/3/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class ShoppingCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingPlaceMapView: MKMapView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var addressDescLbl: UILabel!
    @IBOutlet weak var shoppingPlaceNameLbl: UILabel!
    @IBOutlet weak var categoryDescLbl: UILabel!
    @IBOutlet weak var shoppingImg: UIImageView!
    
    var moreInfo_url = ""
    var fb_url = ""
    
    
    @IBAction func moreInfoBtnPressed(_ sender: UIButton){

        UIApplication.shared.open(URL(string: moreInfo_url)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func fbBtnPressed(_ sender: UIButton){

        UIApplication.shared.open(URL(string: fb_url)!, options: [:], completionHandler: nil)
    }
    
    func configureCell(_ place: Shopping){
        
        
        let allAnnotations = self.shoppingPlaceMapView.annotations
        shoppingPlaceMapView.removeAnnotations(allAnnotations)
        
        self.shoppingImg.image = UIImage(named: place.name)
        self.shoppingImg.clipsToBounds = true
        
        let location = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
        centerMapOnLOcation(location, place: place)
        
        addressDescLbl.text = place.address
        shoppingPlaceNameLbl.text = place.name
        fb_url = place.fb
        moreInfo_url = place.url
        categoryDescLbl.text = place.category
        
        
    }
    
    func centerMapOnLOcation(_ location: CLLocationCoordinate2D, place: Shopping){
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        let artwork = Artwork(title: place.name, locationName: place.address, discipline: "scul", coordinate: location)
        shoppingPlaceMapView.setRegion(region, animated: true)
        shoppingPlaceMapView.addAnnotation(artwork)
    }

    
}
