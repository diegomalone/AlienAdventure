//
//  RedefinePolicingItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - UDPolicingError

enum UDPolicingError: ErrorType {
    case NameContainsLaser
    case ItemFromCunia
    case ValueLessThan10
    
    static let allValues = [NameContainsLaser, ItemFromCunia, ValueLessThan10]
}

extension Hero {
    
    func redefinePolicingItems() -> (UDItem throws -> Void) {
        
        func policingFilter(item: UDItem) throws -> Void {
            let containsLasers = findTheLasers()
            
            if containsLasers(item) {
                throw UDPolicingError.NameContainsLaser
            } else if let planetOfOrigin = item.historicalData["PlanetOfOrigin"] as? String where "Cunia" == planetOfOrigin {
                throw UDPolicingError.ItemFromCunia
            } else if item.baseValue < 10 {
                throw UDPolicingError.ValueLessThan10
            }
        }
        
        return policingFilter        
    }    
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 3"