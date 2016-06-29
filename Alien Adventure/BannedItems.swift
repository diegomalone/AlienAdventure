//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        
        var bannedItemIds = [Int]()
        
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "plist")!
        let dataArray = NSArray(contentsOfURL: dataFileURL)!
        
        for item in dataArray {
            if let name = item["Name"] as? String where name.localizedCaseInsensitiveContainsString("laser") {
                if let historicalData = item["HistoricalData"] as? Dictionary<String, AnyObject> {
                    if let carbonAge = historicalData["CarbonAge"] as? Int where carbonAge < 30 {
                        if let itemId = item["ItemID"] as? Int {
                            bannedItemIds.append(itemId)
                        }
                    }
                }
            }
        }
        
        return bannedItemIds
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"