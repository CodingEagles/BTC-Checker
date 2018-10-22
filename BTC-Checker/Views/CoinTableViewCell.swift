//
//  CoinTableViewCell.swift
//  BTC-Checker
//
//  Created by Ada 2018 on 21/09/2018.
//  Copyright © 2018 tavaboy+daniboy. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
