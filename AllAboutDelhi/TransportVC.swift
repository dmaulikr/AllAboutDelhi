//
//  TransportVC.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 9/20/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class TransportVC: UIViewController {

    @IBAction func backBtnPressed(_ sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tariffBtnPressed(_ sender: UIButton){
        
        UIApplication.shared.open(URL(string: "http://www.delhitourism.gov.in/delhitourism/pdf/transport_tariff.pdf")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func sourcesBtnPressed(_ sender: UIButton){
        UIApplication.shared.open(URL(string: "http://www.delhitourism.gov.in/delhitourism/transport/local_transport.jsp")!, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Transport"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
    }
    
    


    


}
