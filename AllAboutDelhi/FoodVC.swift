//
//  FoodVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 8/30/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class FoodVC: UIViewController {

    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var foodSegmentControl: UISegmentedControl!
    @IBOutlet weak var barsContainer: UIView!
    @IBOutlet weak var restaurantsContainer: UIView!
    @IBOutlet weak var cafeContainer: UIView!
    
    var bar = [Bars]()
    var restaurants = [Restaurant]()
    var cafe = [Cafe]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        barsContainer.isHidden = false
        restaurantsContainer.isHidden = true
        cafeContainer.isHidden = true
        
        navigationItem.title = "Eat/Drink"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeSegmentControl(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            barsContainer.isHidden = false
            restaurantsContainer.isHidden = true
            cafeContainer.isHidden = true
        }else if sender.selectedSegmentIndex == 1 {
            barsContainer.isHidden = true
            restaurantsContainer.isHidden = false
            cafeContainer.isHidden = true
        }else if sender.selectedSegmentIndex == 2 {
            barsContainer.isHidden = true
            restaurantsContainer.isHidden = true
            cafeContainer.isHidden = false
        }
    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AllBarsVC" {
            if let detailVC = segue.destination as? BarsVC{
                let bar = self.bar
                detailVC.bar = bar

            }
        }
        
        if segue.identifier == "AllRestaurantsVC" {
            if let detailVC = segue.destination as? RestaurantsVC {
                let restaurant = self.restaurants
                detailVC.restaurants = restaurant
            }
        }
        
        if segue.identifier == "AllCafeVC" {
            if let detailVC = segue.destination as? CafeVC {
                let cafe = self.cafe
                detailVC.cafe = cafe
            }
        }

    }


}
