//
//  RemoveDuplicates.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func removeDuplicates(inventory: [UDItem]) -> [UDItem] {
        var inventoryDictionary = [Int:UDItem]()
        
        for item in inventory {
            inventoryDictionary.updateValue(item, forKey: item.hashValue)
        }
        
        var newInventory = [UDItem]()
        
        for (_, item) in inventoryDictionary {
            newInventory.append(item)
        }
        
        
        return newInventory
    }
    
}
