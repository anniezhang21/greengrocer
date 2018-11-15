//
//  OneCategroyViewCell.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/14/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit

class OneCategoryViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dateAdded: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
