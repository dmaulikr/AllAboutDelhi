//
//  ShoppingVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/3/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class ShoppingVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var shoppingCollectionView: UICollectionView!
    @IBOutlet weak var shoppingSearchBar: UISearchBar!
    
    var shoppingPlaces = [Shopping]()
    var filtered_shoppingPlaces = [Shopping]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shoppingCollectionView.delegate = self
        shoppingCollectionView.dataSource = self
        
        shoppingSearchBar.delegate = self
        shoppingSearchBar.returnKeyType = UIReturnKeyType.done
        
        navigationItem.title = "Shopping"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    

    @IBAction func mapViewBtnPresses(_ sender: UIButton){
        var place: Shopping!
        let point = sender.convert(CGPoint.zero, to: self.shoppingCollectionView)
        let indexPath = shoppingCollectionView.indexPathForItem(at: point)
        if inSearchMode == true {
            place = filtered_shoppingPlaces[((indexPath as NSIndexPath?)?.row)!]
        }else {
            place = shoppingPlaces[((indexPath as NSIndexPath?)?.row)!]
        }
        performSegue(withIdentifier: "ShoppingMapDetail", sender:place)
    }

    @IBAction func backBtnPressed(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filtered_shoppingPlaces.count
        }
        return shoppingPlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCell {
            let currentPlace: Shopping!
            if inSearchMode == true {
                currentPlace = filtered_shoppingPlaces[(indexPath as NSIndexPath).row]
            } else {
                currentPlace = shoppingPlaces[(indexPath as NSIndexPath).row]
            }
            cell.configureCell(currentPlace)
            return cell
        }
        
        return UICollectionViewCell()
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
            shoppingCollectionView.reloadData()
        }
        else {
            inSearchMode = true
            if let upper = searchBar.text?.capitalized{
            filtered_shoppingPlaces = shoppingPlaces.filter({$0.name.range(of: upper) != nil || $0.address.range(of: upper) != nil})
            shoppingCollectionView.reloadData()
            }

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingMapDetail" {
            if let detailVc = segue.destination as? ShoppingMapDetailVC {
                if let currentPlace = sender as? Shopping {
                    detailVc.currentShoppingPlace = currentPlace
                }
                
            }
        }
    }


}
