//
//  RestaurantCell.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/30/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class RestaurantCell: UICollectionViewCell {
    
    @IBOutlet weak var restaurantMapView: MKMapView!
    @IBOutlet weak var restaurantNameLbl: UILabel!
    @IBOutlet weak var restaurantAddressDescLbl: UILabel!
    @IBOutlet weak var restaurantCategoryLbl: UILabel!
    @IBOutlet weak var restaurantImg: UIImageView!
    
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
    
    func configureCell(_ restaurant: Restaurant){
        
        let allAnnotations = self.restaurantMapView.annotations
        restaurantMapView.removeAnnotations(allAnnotations)

        self.restaurantImg.image = UIImage(named: restaurant.name)
        self.restaurantImg.clipsToBounds = true
        
        restaurantNameLbl.text = restaurant.name
        restaurantCategoryLbl.text = restaurant.category
        moreInfo_url = restaurant.url
        fb_url = restaurant.fb
        
        var location: CLLocationCoordinate2D
        
        if restaurant.address.count > 1 {
            restaurantAddressDescLbl.text = "\(restaurant.name) has \(restaurant.address.count) branches in Delhi\nTap the map below to check all the locations."
            
            for i in 0 ..< restaurant.address.count {
                self.latitude = restaurant.latitude[0]
                self.longitude = restaurant.longitude[0]
                self.branch = restaurant.branch[0]
                self.address = restaurant.address[0]
                location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                centerMap(location, res: restaurant)
            }

        }
        else {
            
            restaurantAddressDescLbl.text = restaurant.address[0]
            location = CLLocationCoordinate2D(latitude: restaurant.latitude[0], longitude: restaurant.longitude[0])
            centerMap(location, res: restaurant)
        }
        
        
        
        
    }
    
    func centerMap(_ location: CLLocationCoordinate2D, res: Restaurant){
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(location, span)
        let artwork = Artwork(title: branch, locationName: address, discipline: "mil", coordinate: location)
        restaurantMapView.setRegion(region, animated: true)
        restaurantMapView.addAnnotation(artwork)
    }
    
}
