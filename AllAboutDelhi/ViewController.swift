//
//  ViewController.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/4/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit
import Gloss
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

   
    @IBOutlet weak var aboutImg: UIImageView!
    @IBOutlet weak var placesImg: UIImageView!
    @IBOutlet weak var jsonDownloadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imagesPageControl: UIPageControl!
    @IBOutlet weak var imageGalleryCollectionView: UICollectionView!
    
    var isMapExpanded = "No"
    var currentMapWidth: CGFloat = 0
    var currentMapHeight: CGFloat = 0
    var tappedImgTag = 0
    var placesArray = [Dictionary<String, AnyObject>]()
    var allPlaces = [Dictionary<String,AnyObject>]()
    var location = [Dictionary<String, AnyObject>]()
    var locationDict = [String:AnyObject]()
    var attractions = [Place]()
    var finishedDownloading = false

    var allBars = [Dictionary<String, AnyObject>]()
    var currentBar = [Bars]()
    
    var allRestaurants = [Dictionary<String, AnyObject>]()
    var currentRestaurant = [Restaurant]()
    var restaurantLocation = [Dictionary<String, AnyObject>]()
    var restaurantAddresses = [String]()
    var restaurantBranch = [String]()
    var restaurantLatitude = [Double]()
    var restaurantLongitude = [Double]()
    
    var allCafe = [Dictionary<String, AnyObject>]()
    var currentCafe = [Cafe]()
    var cafeLocation = [Dictionary<String, AnyObject>]()
    var cafeAddresses = [String]()
    var cafeBranch = [String]()
    var cafeLatitude = [Double]()
    var cafeLongitude = [Double]()
    
    var allShoppingPlace = [Dictionary<String, AnyObject>]()
    var currentShoppingPlace = [Shopping]()
    
    var images = ["1","2","3","4","5","6","7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.isHidden = false
        jsonDownloadingIndicator.startAnimating()
        getData()
        
        imageGalleryCollectionView.delegate = self
        imageGalleryCollectionView.dataSource = self
    
        configurePageControl()
        
        
    }
   
    
    func configurePageControl(){
        imagesPageControl.numberOfPages = images.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.finishedDownloading == true {
            self.jsonDownloadingIndicator.stopAnimating()
            containerView.isHidden = true
            jsonDownloadingIndicator.isHidden = true
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageGalleryCell", for: indexPath) as? ImageGalleryCell {
            cell.configureCell(images[(indexPath as NSIndexPath).row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height = collectionView.bounds.size.height
        
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        imagesPageControl.currentPage = index
    }

    
    func getData(){
        
        DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
            var json: [String: AnyObject]!
            do{
                json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions()) as? [String: AnyObject]
            } catch {
                print(error)
            }
            
            guard let jsonData = TopFeed(json: json) else {
                print("error initializing json")
                return
            }
            
            
            if let content = jsonData.feed?.places {
                self.allPlaces = content
            }
            
            if let barContent =  jsonData.feed?.bars {
                self.allBars = barContent
            }
            
            if let restaurantContent = jsonData.feed?.restaurants {
                self.allRestaurants = restaurantContent
            }
            
            if let cafeContent = jsonData.feed?.cafe {
                self.allCafe = cafeContent
            }
            
            if let shoppingContent = jsonData.feed?.shopping {
                self.allShoppingPlace = shoppingContent
            }

            for i in 0 ..< self.allPlaces.count {
                self.location = (self.allPlaces[i]["location"] as? [Dictionary<String,AnyObject>])!
                
                let places = Place(name: self.allPlaces[i]["name"] as! String, address: self.location[0]["address"] as! String, latitude: self.location[0]["lat"] as! Double, longitude: self.location[0]["long"] as! Double, price: self.allPlaces[i]["price"] as! String, trainStation: self.allPlaces[i]["train"] as! String, hours: self.allPlaces[i]["hours"] as! String, about: self.allPlaces[i]["about"] as! String, source: self.allPlaces[i]["website"] as! String)
                self.attractions.append(places)
                self.location = []
                
            }
            
            for i in 0 ..< self.allBars.count {
                let barsDetails = Bars(address: self.allBars[i]["address"] as! String, name: self.allBars[i]["name"] as! String, longitude: self.allBars[i]["long"] as! Double, latitude: self.allBars[i]["lat"] as! Double, fb: self.allBars[i]["fb"] as! String, url: self.allBars[i]["url"] as! String, category: self.allBars[i]["category"] as! String)

                self.currentBar.append(barsDetails)

            }
            
            for i in 0 ..< self.allRestaurants.count {
                
                self.restaurantLocation = self.allRestaurants[i]["location"] as! [Dictionary<String,AnyObject>]
                
                for i in 0 ..< self.restaurantLocation.count {
                    self.restaurantAddresses.append(self.restaurantLocation[i]["address"] as! String)
                    self.restaurantBranch.append(self.restaurantLocation[i]["branch"] as! String)
                    self.restaurantLongitude.append(self.restaurantLocation[i]["long"] as! Double)
                     self.restaurantLatitude.append(self.restaurantLocation[i]["lat"] as! Double)
                }
                
                let restaurantDetails = Restaurant(name: self.allRestaurants[i]["name"] as! String, fb: self.allRestaurants[i]["fb"] as! String, url: self.allRestaurants[i]["url"] as! String, category: self.allRestaurants[i]["category"] as! String, address: self.restaurantAddresses, branch: self.restaurantBranch, longitude: self.restaurantLongitude , latitude: self.restaurantLatitude)
                
                self.currentRestaurant.append(restaurantDetails)
                
                self.restaurantAddresses = []
                self.restaurantBranch = []
                self.restaurantLongitude = []
                self.restaurantLatitude = []
                
            }
            
            for i in 0 ..< self.allCafe.count {
                
                self.cafeLocation = self.allCafe[i]["location"] as! [Dictionary<String,AnyObject>]
                
                for i in 0 ..< self.cafeLocation.count {
                    self.cafeAddresses.append(self.cafeLocation[i]["address"] as! String)
                    self.cafeBranch.append(self.cafeLocation[i]["branch"] as! String)
                    self.cafeLongitude.append(self.cafeLocation[i]["long"] as! Double)
                    self.cafeLatitude.append(self.cafeLocation[i]["lat"] as! Double)
                }
                

                
                
                let cafeDetails = Cafe(name: self.allCafe[i]["name"] as! String, fb: self.allCafe[i]["fb"] as! String, url: self.allCafe[i]["url"] as! String, category: self.allCafe[i]["category"] as! String, address: self.cafeAddresses, branch: self.cafeBranch, longitude: self.cafeLongitude , latitude: self.cafeLatitude)
                
                self.currentCafe.append(cafeDetails)
                
                self.cafeAddresses = []
                self.cafeBranch = []
                self.cafeLongitude = []
                self.cafeLatitude = []
            }
            
            for i in 0 ..< self.allShoppingPlace.count {
                let shoppingDetails = Shopping(address: self.allShoppingPlace[i]["address"] as! String, name: self.allShoppingPlace[i]["name"] as! String, longitude: self.allShoppingPlace[i]["long"] as! Double, latitude: self.allShoppingPlace[i]["lat"] as! Double, fb: self.allShoppingPlace[i]["fb"] as! String, url: self.allShoppingPlace[i]["url"] as! String, category: self.allShoppingPlace[i]["category"] as! String)
                
                self.currentShoppingPlace.append(shoppingDetails)
                
            }
            
        }
        
        self.finishedDownloading = true
    }
    
    @IBAction func attractionBtnPressed(_ sender: UIButton){
        performSegue(withIdentifier: "AttractionVC", sender:self)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AttractionVC" {
            if let detailVC = segue.destination as? UINavigationController {
                if let topVC = detailVC.topViewController as? PlacesToVisitVC {
                topVC.attractions = self.attractions
                }
            }
        }
        
        if segue.identifier == "BarVC" {
            if let detailVC = segue.destination as? UINavigationController {
                if let topVC = detailVC.topViewController as? FoodVC {
                    topVC.bar = self.currentBar
                    topVC.restaurants = self.currentRestaurant
                    topVC.cafe = self.currentCafe
                }
            }
        }
        
        if segue.identifier == "ShoppingNavigation" {
            if let detailVC = segue.destination as? UINavigationController {
                if let topVC = detailVC.topViewController as? ShoppingVC {
                    topVC.shoppingPlaces = self.currentShoppingPlace
                }
                
            }
        }
    }

}

