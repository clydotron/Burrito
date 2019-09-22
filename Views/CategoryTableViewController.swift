//
//  CategoryTableViewController.swift
//  Burrito
//
//  Created by Brian Green on 9/6/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var groups: Groups?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.groups = (UIApplication.shared.delegate as! AppDelegate).mainGroups
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups?.allGroups.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = groups?.allGroups[indexPath.row].name ?? "N/A"
        
        return cell
    }



 

}
