//
//  AboutDelhiVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/2/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class AboutDelhiVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "About"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    @IBAction func moreInfoBtnPressed(_ sender: UIButton){

        UIApplication.shared.open(URL(string: "http://boi.gov.in")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func sourcesBtnPressed(_ sender: UIButton){
        UIApplication.shared.open(URL(string: "http://www.delhitourism.gov.in///delhitourism/aboutus/index.jsp")!, options: [:], completionHandler: nil)
    }

    @IBAction func backBtnPressed(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }


}
