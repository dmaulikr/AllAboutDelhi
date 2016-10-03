//
//  BarsCell.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/26/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class BarsCell: UICollectionViewCell {
    
    @IBOutlet weak var barsMapView: MKMapView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var addressDescLbl: UILabel!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!
    @IBOutlet weak var barNameLbl: UILabel!
    @IBOutlet weak var barImg: UIImageView!
    @IBOutlet weak var barCategory: UILabel!
    
    var moreInfo_url = ""
    var fb_url = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func moreInfoBtnPressed(_ sender: UIButton){
        UIApplication.shared.open(URL(string: moreInfo_url)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func fbBtnPressed(_ sender: UIButton){
        UIApplication.shared.open(URL(string: fb_url)!, options: [:], completionHandler: nil)
    }
    

    
    func configureCell(_ bar: Bars){

        let allAnnotations = self.barsMapView.annotations
        barsMapView.removeAnnotations(allAnnotations)
        
        self.barImg.image = UIImage(named: bar.name)
        self.barImg.clipsToBounds = true
        
        addressDescLbl.text = bar.address
        barNameLbl.text = bar.name
        barCategory.text = bar.category
        fb_url = bar.fb
        moreInfo_url = bar.url

        let location = CLLocationCoordinate2D(latitude: bar.latitude, longitude: bar.longitude)
        centerMapOnLOcation(location, bar: bar)

    }
    
    func centerMapOnLOcation(_ location: CLLocationCoordinate2D, bar: Bars){
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        let artwork = Artwork(title: bar.name, locationName: bar.address, discipline: "scul", coordinate: location)
        self.barsMapView.setRegion(region, animated: true)
        self.barsMapView.addAnnotation(artwork)
    }
    

}
