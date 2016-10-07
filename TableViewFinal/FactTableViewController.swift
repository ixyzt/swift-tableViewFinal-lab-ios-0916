//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


//--First, add a constant String called factCellIdentifier. This is the reuse identifier for the cells managed by this table view controller, so it will be used to dequeue a reusable cell for this table. Assign to this variable the string "FactCell".
//--Create a property planet of type Planet!. This will store the planet whose facts are displayed in this table.
//??Override viewDidLoad() to change the title of the table view to the name of the planet stored in the planet property. This title will be displayed in the nav bar. Don't forget to call super.viewDidLoad(), too!
//--Override numberOfSections(in:) to return the number of sections in this table view (just one).
//--Override tableView(_:numberOfRowsInSection:) to return the number of rows in the table. This is equal to the number of facts you have for the planet being displayed in this view. Remember, the planet is stored in the planet property, and Planets have a facts array that stores all their facts.

class FactTableViewController: UITableViewController {
    
    let factCellIdentifier: String = "FactCell"
    
    var planet: Planet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = planet?.name
    }
    
    //determine number of sections in tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //determine number of Rows in Section, return the number of items in the item list
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (planet?.facts.count)!
    }
    
    //You need to override tableView(_:cellForRowAt:). This method should dequeue a reusable cell using the reuse identifier specified in the table view controller's planetCellIdentifier property, then initialize its labels and return the cell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: factCellIdentifier, for: indexPath) as? FactTableViewCell
        
        cell?.factTextView.text = planet.facts[indexPath.row]
        
        return cell!
    }

    
}
