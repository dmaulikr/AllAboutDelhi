//
//  RestaurantsVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/30/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class RestaurantsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var restaurantsCollectionView: UICollectionView!
    @IBOutlet weak var restaurantSearchBar: UISearchBar!
    
    var restaurants = [Restaurant]()
    var filteredRestaurants = [Restaurant]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantsCollectionView.dataSource = self
        restaurantsCollectionView.delegate = self
        
        restaurantSearchBar.delegate = self
        restaurantSearchBar.returnKeyType = UIReturnKeyType.done
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    @IBAction func restaurantMapViewPressed(_ sender: UIButton){
        var restaurant: Restaurant!
        let point = sender.convert(CGPoint.zero, to: self.restaurantsCollectionView)
        let indexPath = restaurantsCollectionView.indexPathForItem(at: point)
        if inSearchMode == true {
            restaurant = filteredRestaurants[((indexPath as NSIndexPath?)?.row)!]
        }else {
            restaurant = restaurants[((indexPath as NSIndexPath?)?.row)!]
        }
        performSegue(withIdentifier: "RestaurantsMapDetail", sender:restaurant)
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as? RestaurantCell {
            let res: Restaurant!
            if inSearchMode == true {
                res = filteredRestaurants[(indexPath as NSIndexPath).row]
            }
            else {
                res = restaurants[(indexPath as NSIndexPath).row]
            }
            cell.configureCell(res)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredRestaurants.count
        }
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height = collectionView.bounds.size.height
        return CGSize(width: width - 30, height: height)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            restaurantsCollectionView.reloadData()
        } else {
            inSearchMode = true
            if let upper = searchBar.text?.capitalized{
            filteredRestaurants = restaurants.filter({$0.name.range(of: upper) != nil})
            restaurantsCollectionView.reloadData()
            }
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RestaurantsMapDetail" {
        if let detailVC = segue.destination as? RestaurantMapDetailVC {
            detailVC.restaurant = sender as? Restaurant
            
            }
        }
    }

}
