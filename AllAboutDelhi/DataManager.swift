//
//  DataManager.swift
//  AllAboutDelhi
//
//  Created by Dushyant Dahiya on 7/10/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation

open class DataManager {
    
    open class func getTopAppsDataFromFileWithSuccess(_ success: @escaping ((_ data: Data) -> Void)) {
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: {
            let filePath = Bundle.main.path(forResource: "delhi", ofType:"json")
            let data = try! Data(contentsOf: URL(fileURLWithPath: filePath!),
                options: NSData.ReadingOptions.uncached)
            success(data)
        })
}
    
    func getDataFromFile(_ success: ((_ data: Data) -> Void)) {
        
    }
    
    
}
