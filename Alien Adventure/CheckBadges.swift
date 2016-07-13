//
//  CheckBadges.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func checkBadges(badges: [Badge], requestTypes: [UDRequestType]) -> Bool {
        
        for requestType in requestTypes {
            var hasBadge = false
            for badge in badges {
                if requestType == badge.requestType {
                    hasBadge = true
                }
            }
            
            if !hasBadge {
                return false
            }
        }
        
        return true
    }
    
}
