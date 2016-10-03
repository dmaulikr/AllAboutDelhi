//
//  PlacesToVisitVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/12/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class PlacesToVisitVC: UIViewController, UISearchBarDelegate, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

   
    @IBOutlet weak var placesCollectionView: UICollectionView!
    @IBOutlet weak var placeSearchBar: UISearchBar!
    var attractions = [Place]()
    var currentIndex:Int!
    var filteredAttractions = [Place]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesCollectionView.delegate = self
        placesCollectionView.dataSource = self
        
        placeSearchBar.delegate = self
        placeSearchBar.returnKeyType = UIReturnKeyType.done
        
        navigationItem.title = "Attractions"
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        placeSearchBar.resignFirstResponder()
    }
    
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }

    
    func addTapped(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredAttractions.count
        }
        return attractions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCell", for: indexPath) as? PlaceCell {
            var currentPlace: Place!
            if inSearchMode == true {
                currentPlace = filteredAttractions[(indexPath as NSIndexPath).row]
            } else {
                currentPlace = attractions[(indexPath as NSIndexPath).row]
            }
            cell.configureCell(currentPlace)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height = collectionView.bounds.size.height
        return CGSize(width: width-30 , height: height)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            inSearchMode = false
            view.endEditing(true)
            placesCollectionView.reloadData()
        } else {
            inSearchMode = true
            if let upper = searchBar.text?.capitalized{
                filteredAttractions = attractions.filter({$0.name.range(of: upper) != nil || $0.address.range(of: upper) != nil})
                placesCollectionView.reloadData()
            }
            
        }
    }
    
    @IBAction func overviewTapped(_ sender: UIButton){
        
        var place:Place!
        let point = sender.convert(CGPoint.zero, to: self.placesCollectionView)
        let indexPath = placesCollectionView.indexPathForItem(at: point)
        if inSearchMode == true {
            place = filteredAttractions[((indexPath as NSIndexPath?)?.row)!]
        }else {
            place = attractions[((indexPath as NSIndexPath?)?.row)!]
        }
        performSegue(withIdentifier: "PlaceDetail", sender:place)
        
    }
    
    @IBAction func mapViewTapped(_ sender: UIButton){
        var place:Place!
        let point = sender.convert(CGPoint.zero, to: self.placesCollectionView)
        let indexPath = placesCollectionView.indexPathForItem(at: point)
        if inSearchMode == true {
            place = filteredAttractions[((indexPath as NSIndexPath?)?.row)!]
        }else {
            place = attractions[((indexPath as NSIndexPath?)?.row)!]
        }
        performSegue(withIdentifier: "MapDetail", sender:place)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceDetail"{
            if let detailVC = segue.destination as? AboutVC {
                if let currentPlace = sender as? Place {
                    detailVC.place = currentPlace
                }
            }
        } else if segue.identifier == "MapDetail" {
            if let detailvc = segue.destination as? AttractionMapDetailVC {
                if let currentPlace = sender as? Place {
                    detailvc.place = currentPlace
                }
            }
        }

    }

    
}
