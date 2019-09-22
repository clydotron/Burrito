//
//  OrganismDetailViewController.swift
//  Burrito
//
//  Created by Brian Green on 9/6/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import UIKit

class OrganismDetailViewController: UIViewController {

    var organism: Organism? {
        didSet {
            refreshUI()
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var commonNameLabel: UILabel!
    @IBOutlet weak var fancyNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        refreshUI();
    }
    

        private func refreshUI() {
            if commonNameLabel != nil {
                commonNameLabel.text = organism?.commonName
                fancyNameLabel.text = organism?.fancyName
                
            }
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
