//
//  GroupDetailTableViewController.swift
//  Burrito
//
//  Created by Brian Green on 9/22/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GroupDetailCell"

class GroupDetailTableViewController: UITableViewController {

    var group: OrganismGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return group?.members.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) // as! GroupDetailTableViewCell

        // Configure the cell...
        cell.textLabel?.text = group?.members[indexPath.row].commonName
        cell.detailTextLabel?.text = group?.members[indexPath.row].fancyName
        
        
        return cell
    }
    
    fileprivate struct Segues {
        static let ShowOrganismDetail = "ShowOrganismDetail"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath);
        
        performSegue(withIdentifier: Segues.ShowOrganismDetail, sender: selectedCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.ShowOrganismDetail {
            if let vc = segue.destination as? OrganismDetailViewController {
                if let selected = self.tableView.indexPathForSelectedRow {
                    vc.organism = group?.members[selected.row]
                }
            }
        }
    }


}
