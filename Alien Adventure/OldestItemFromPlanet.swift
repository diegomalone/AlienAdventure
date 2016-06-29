//
//  OldestItemFromPlanet.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func oldestItemFromPlanet(inventory: [UDItem], planet: String) -> UDItem? {
        
        var myItemsFromPlanet = itemsFromPlanet(inventory, planet: planet)
        
        if myItemsFromPlanet.count == 0 {
            return nil
        }
        
        var oldestItem = myItemsFromPlanet[0]
        var oldestItemAge = oldestItem.historicalData["CarbonAge"] as? Int
        
        for item in myItemsFromPlanet {
            if let carbonAge = item.historicalData["CarbonAge"] as? Int where carbonAge > oldestItemAge {
                oldestItemAge = carbonAge
                oldestItem = item
            }
        }
        
        return oldestItem
    }
    
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 2"