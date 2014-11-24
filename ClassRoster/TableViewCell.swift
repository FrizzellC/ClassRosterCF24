//
//  TableViewCell.swift
//  ClassRoster
//
//  Created by chantel Frizzell on 11/19/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstNameInCell: TableViewCell!

    @IBOutlet weak var lastNameInCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
