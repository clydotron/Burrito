//
//  GroupsCollectionViewController.swift
//  Burrito
//
//  Created by Brian Green on 9/21/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GroupCell"

class GroupsCollectionViewController: UICollectionViewController {

    var groups = [OrganismGroup]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // get the groups info from the app delegate
        if let repo = (UIApplication.shared.delegate as! AppDelegate).organismRepo {
            self.groups = repo.groups
        }
    }
}

// MARK: - UICollectionViewDataSource
extension GroupsCollectionViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    //3
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GroupsCollectionViewCell
        
        cell.backgroundColor = randomColor()
        
        //let group = groups[indexPath.row]
        
        cell.label.text = groups[indexPath.row].name
        
        //randomize the color of the cell
        
        // Configure the cell
        return cell
    }
    
    fileprivate struct Segues {
        static let ShowGroupDetail = "ShowGroupDetail"
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = self.collectionView.cellForItem(at: indexPath)
        performSegue(withIdentifier: Segues.ShowGroupDetail, sender: selectedCell)
        //storyboard?
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueID = segue.identifier {
            if segueID == Segues.ShowGroupDetail {
                
                // this was from when i was using a split/view,
                //guard let svc = segue.destination as? UISplitViewController else { return }
                //guard let navcon = svc.viewControllers[0] as? UINavigationController else { return }
                //guard let selected = self.collectionView.indexPathsForSelectedItems else { return }
                //guard let mvc = navcon.viewControllers[0] as? GroupDetailTableViewController else { return }
                guard let vc = segue.destination as? GroupDetailTableViewController else { return }
                
                if let cell = sender as? UICollectionViewCell {
                    if let selected = self.collectionView.indexPath(for: cell) {
                        vc.group = groups[selected.row]
                    }
                }
            }
        }
    }
    
    
    // custom function to generate a random UIColor
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
