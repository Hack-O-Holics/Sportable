//
//  CustomTableViewCell.swift
//  Sportable
//
//  Created by Shreeniket Bendre on 8/23/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lbl.text = "Assignment - Pushups (Code: 7319)"
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
