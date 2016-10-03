//
//  CafeVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/31/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class CafeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var cafeCollectionView: UICollectionView!
    @IBOutlet weak var cafeSearchBar: UISearchBar!
    
    var cafe = [Cafe]()
    var filteredCafe = [Cafe]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cafeCollectionView.delegate = self
        cafeCollectionView.dataSource = self
        
        cafeSearchBar.delegate = self
        cafeSearchBar.returnKeyType = UIReturnKeyType.done
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    @IBAction func restaurantMapViewPressed(_ sender: UIButton){
        var newCafe: Cafe!
        let point = sender.convert(CGPoint.zero, to: self.cafeCollectionView)
        let indexPath = cafeCollectionView.indexPathForItem(at: point)
        if inSearchMode == true {
            newCafe = filteredCafe[((indexPath as NSIndexPath?)?.row)!]
        }else {
            newCafe = cafe[((indexPath as NSIndexPath?)?.row)!]
        }
        performSegue(withIdentifier: "CafeMapDetail", sender:newCafe)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredCafe.count
        }
        return cafe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CafeVC", for: indexPath) as? CafeCell {
            let newCafe: Cafe!
            if inSearchMode == true {
                newCafe = filteredCafe[(indexPath as NSIndexPath).row]
            }
            else {
                newCafe = cafe[(indexPath as NSIndexPath).row]
            }
            cell.configureCell(newCafe)
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
            cafeCollectionView.reloadData()
        } else {
            inSearchMode = true
            if let upper = searchBar.text?.capitalized{
            filteredCafe = cafe.filter({$0.name.range(of: upper) != nil })
            cafeCollectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CafeMapDetail" {
            if let detailVC = segue.destination as? CafeMapDetailVc{
                detailVC.cafe = sender as? Cafe
            }
            
        }
    }


}
