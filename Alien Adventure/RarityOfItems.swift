//
//  RarityOfItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func rarityOfItems(inventory: [UDItem]) -> [UDItemRarity:Int] {
        
        var itemRarityDictionary = [UDItemRarity:Int]()
        
        itemRarityDictionary[UDItemRarity.Common] = 0
        itemRarityDictionary[UDItemRarity.Uncommon] = 0
        itemRarityDictionary[UDItemRarity.Rare] = 0
        itemRarityDictionary[UDItemRarity.Legendary] = 0
        
        for item in inventory {
            if let itemRarityCount = itemRarityDictionary[item.rarity] {
                itemRarityDictionary.updateValue(itemRarityCount + 1, forKey: item.rarity)
            }
        }
        
        return itemRarityDictionary
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"