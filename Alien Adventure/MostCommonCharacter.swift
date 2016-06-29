//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        
        if inventory.count == 0 {
            return nil
        }
        
        var characterList = [Character:Int]()
        for item in inventory {
            for character in item.name.lowercaseString.characters {
                if let currentValueForCharacter = characterList[character] {
                    characterList.updateValue(currentValueForCharacter + 1, forKey: character)
                } else {
                    characterList.updateValue(1, forKey: character)
                }
            }
        }
        
        var mostCommon: Character = "a"
        var mostCommonCharacterCount = 0
        for (character, totalTimesCharacterAppeared) in characterList {
            if totalTimesCharacterAppeared > mostCommonCharacterCount {
                mostCommon = character
                mostCommonCharacterCount = totalTimesCharacterAppeared
            }
        }
        
        return mostCommon
    }
}
