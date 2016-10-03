//
//  BarsVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/26/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import MapKit

class BarsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    
    @IBOutlet weak var barsCollectionView: UICollectionView!
    @IBOutlet weak var barsSearchBar: UISearchBar!
    
    var bar = [Bars]()
    var filteredBars = [Bars]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barsCollectionView.delegate = self
        barsCollectionView.dataSource = self
        
        
        barsSearchBar.delegate = self
        barsSearchBar.returnKeyType = UIReturnKeyType.done
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    
    @IBAction func mapViewBtnPresses(_ sender: UIButton){
        var bars: Bars!
        let point = sender.convert(CGPoint.zero, to: self.barsCollectionView)
        let indexPath = barsCollectionView.indexPathForItem(at: point)
        if inSearchMode == true {
            bars = filteredBars[((indexPath as NSIndexPath?)?.row)!]
        }else {
            bars = bar[((indexPath as NSIndexPath?)?.row)!]
        }
        performSegue(withIdentifier: "BarsMapDetail", sender:bars)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredBars.count
        }
        return bar.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarsVC", for: indexPath) as? BarsCell {
            let currentBar: Bars!
            if inSearchMode == true {
                currentBar = filteredBars[(indexPath as NSIndexPath).row]
            }
            else {
                currentBar = bar[(indexPath as NSIndexPath).row]
            }
            cell.configureCell(currentBar)
            return cell
        }
        
        
            return UICollectionViewCell()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            barsCollectionView.reloadData()
        } else {
            inSearchMode = true
            if let upper = searchBar.text?.capitalized{
            filteredBars = bar.filter({$0.name.range(of: upper) != nil || $0.address.range(of: upper) != nil})
            barsCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height = collectionView.bounds.size.height
        return CGSize(width: width - 30, height: height)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BarsMapDetail" {
            if let detailVC = segue.destination as? BarMapDetailVC {
                if let currentBar = sender as? Bars {
                    detailVC.currentBar = currentBar
                    
                }
                
            }
        }
    }

}
