//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func calculateRarityPoints(common: Int, uncommon: Int, rare: Int, legendary: Int) -> Int {
        return (1 * common) + (2 * uncommon) + (3 * rare) + (4 * legendary)
    }
    
    func planetData(dataFile: String) -> String {
        
        let dataFileJSONURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "json")!
        let dataJSON = NSData(contentsOfURL: dataFileJSONURL)!
        
        var dataArrayFromJSON: NSArray!
        do {
            dataArrayFromJSON = try! NSJSONSerialization.JSONObjectWithData(dataJSON, options: NSJSONReadingOptions()) as! NSArray
        }
        
        var mostPointsPlanetName = ""
        var totalPointsForMostPointsPlanet = 0
        for planet in dataArrayFromJSON {
            if let commonItems = planet["CommonItemsDetected"] as? Int {
                if let uncommonItems = planet["UncommonItemsDetected"] as? Int {
                    if let rareItems = planet["RareItemsDetected"] as? Int {
                        if let legendaryItems = planet["LegendaryItemsDetected"] as? Int {
                            if let planetName = planet["Name"] as? String {
                                let currentPlanetPoints = calculateRarityPoints(commonItems, uncommon: uncommonItems, rare: rareItems, legendary: legendaryItems)
                                                                
                                if currentPlanetPoints > totalPointsForMostPointsPlanet {
                                    totalPointsForMostPointsPlanet = currentPlanetPoints
                                    mostPointsPlanetName = planetName
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return mostPointsPlanetName
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"