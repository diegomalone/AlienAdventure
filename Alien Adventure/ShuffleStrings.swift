//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        
        if s1 == "" && s2 == "" && shuffle == "" {
            return true
        }
        
        let shuffleLength = shuffle.characters.count
        let s1Length = s1.characters.count
        let s2Length = s2.characters.count
        
        if shuffleLength > s1Length + s2Length || shuffleLength < s1Length + s2Length {
            return false
        }
        
        func checkValidShuffle(checking: String, shuffle: String) -> Bool {
            
            var currentIndex = 0
            for character in shuffle.characters {
                if character == checking[checking.startIndex.advancedBy(currentIndex)] {
                    currentIndex += 1
                }
                
                if currentIndex == checking.characters.count {
                    return true
                }
            }
            
            return false
        }
        
        return checkValidShuffle(s1, shuffle: shuffle) && checkValidShuffle(s2, shuffle: shuffle)
    }
}
