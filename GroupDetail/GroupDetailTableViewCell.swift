//
//  GroupDetailTableViewCell.swift
//  Burrito
//
//  Created by Brian Green on 9/22/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import UIKit

class GroupDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var commonName: UILabel!
    @IBOutlet weak var fancyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
