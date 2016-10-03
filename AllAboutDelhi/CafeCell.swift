//
//  CafeCell.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/31/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class CafeCell: UICollectionViewCell {
    
    @IBOutlet weak var cafeNameLbl: UILabel!
    @IBOutlet weak var cafeCategoryLbl: UILabel!
    @IBOutlet weak var cafeAdressDescLbl: UILabel!
    @IBOutlet weak var cafeMapView: MKMapView!
    @IBOutlet weak var cafeImg: UIImageView!
    
    var longitude: Double = 0
    var latitude: Double = 0
    var branch = ""
    var address = ""
    
    var moreInfo_url = ""
    var fb_url = ""
    
    @IBAction func moreInfoBtnPressed(_ sender: UIButton){
         UIApplication.shared.open(URL(string: moreInfo_url)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func fbBtnPressed(_ sender: UIButton){

        UIApplication.shared.open(URL(string: fb_url)!, options: [:], completionHandler: nil)

    }
    
    func configureCell(_ cafe: Cafe){
        
        let allAnnotations = self.cafeMapView.annotations
        cafeMapView.removeAnnotations(allAnnotations)

        self.cafeImg.image = UIImage(named: cafe.name)
        self.cafeImg.clipsToBounds = true
        
        moreInfo_url = cafe.url
        fb_url = cafe.fb
        
        cafeNameLbl.text = cafe.name
        cafeCategoryLbl.text = cafe.category
        
        var location: CLLocationCoordinate2D
        
        if cafe.address.count > 1 {
            cafeAdressDescLbl.text = "\(cafe.name) has \(cafe.address.count) branches in Delhi\nTap the map below to check all the locations."
            
            for i in 0 ..< cafe.address.count {
                self.latitude = cafe.latitude[0]
                self.longitude = cafe.longitude[0]
                self.branch = cafe.branch[0]
                self.address = cafe.address[0]
                location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                centerMap(location, cafe: cafe)
            }
            
        }
        else {
            
            cafeAdressDescLbl.text = cafe.address[0]
            location = CLLocationCoordinate2D(latitude: cafe.latitude[0], longitude: cafe.longitude[0])
            centerMap(location, cafe: cafe)
        }
        
        
    }
    
    func centerMap(_ location: CLLocationCoordinate2D, cafe: Cafe){
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegionMake(location, span)
        let artwork = Artwork(title: branch, locationName: address, discipline: "mil", coordinate: location)
        cafeMapView.setRegion(region, animated: true)
        cafeMapView.addAnnotation(artwork)
    }

    
}
