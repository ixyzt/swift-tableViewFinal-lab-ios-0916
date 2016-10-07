//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


//--Add a property called planetCellIdentifier. This is a String which will identify the type of cell you want to dequeue from the table view. Assign this the string "PlanetCell".
//--You will also need to create a property called planets to store the facts for a list of planets. You already have a Planet class that will store the data, and a table view will show multiple planets, so what should the type of this property be? (If you guessed [Planet], you're right!)
//??Next, you should create a method called generatePlanetInfo() that will fill in the planets property you just created. This method takes no parameters and returns no value (it sets the planets property directly). To keep this simple, you only need to generate facts for two planets, Earth and Mars. Here are the planets and their relevant facts:
//--You will need to call generatePlanetInfo() to fill in the planets property. You can call this from an overriden viewDidLoad() method. Don't forget to call `super.viewDidLoad() first!
//--Implement numberOfSections(in:). There is only one section in this table view.
//--Implement tableView(_:numberOfRowsInSection:). The number of rows is equal to the number of planets tracked by this class.
//--Implement prepare(for:sender:). This method first needs to get the destination view controller using segue.destinationViewController and cast it to a view controller of type FactTableViewController. It then needs to get the index path for the selected row, and grab the correct planet from the planets property. Finally, it should set the planet property of the destination view controller to the selected planet. (If you need help, take a look at the previous labs and lessons for hints on how to implement this method properly.)

class PlanetTableViewController: UITableViewController {
    
    var planetCellIdentifier = "PlanetCell"
    var planets = [Planet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
        
        print("Hello World!")
    }
    
    func generatePlanetInfo() {
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.", "Earth has a powerful magnetic field.","Earth was once believed to be the center of the universe."])
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.","Mars is home to the tallest mountain in the solar system.","Pieces of Mars have fallen to Earth."])
        planets += [earth,mars]
    }
    
    //determine number of sections in tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //determine number of Rows in Section, return the number of items in the item list
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    
    //You need to override tableView(_:cellForRowAt:). This method should dequeue a reusable cell using the reuse identifier specified in the table view controller's planetCellIdentifier property, then initialize its labels and return the cell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as? PlanetTableViewCell
        
        cell?.planetNameLabel.text = planets[indexPath.row].name
        cell?.numberOfMoonsLabel.text = "\(planets[indexPath.row].numberOfMoons) moons"
        cell?.numberOfDaysFullOrbitLabel.text = "\(planets[indexPath.row].fullOrbit) days (full orbit)"
        
        
        return cell!
    }
    
    //prepare for the segue, by pointing to the right segue identifier, then cast the segue.destination as the viewController class you'll be using for the View.  Then set the destination variable value to the list contents at the selected indexPath.row.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "PlanetDetailView" { return }
        if let dest = segue.destination as? FactTableViewController, let indexPath = tableView.indexPathForSelectedRow {
            dest.planet = planets[indexPath.row]
        }
    }


    
    
    
    
    
    
}
