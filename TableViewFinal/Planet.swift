//
//  Planet.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


//Add four properties to the Planet class: name, numberOfMoons, fullOrbit, and facts. name should obviously be a String, and numberOfMoons should be an Int
class Planet {
    
    var name: String
    var numberOfMoons: Int
    var fullOrbit: Double
    var facts = [String]()
    
    init(name: String, numberOfMoons: Int, fullOrbit: Double, facts: [String]) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.fullOrbit = fullOrbit
        self.facts = facts
    }
    
}
