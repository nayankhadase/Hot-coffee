//
//  OrdersTableViewCell.swift
//  Hot coffee
//
//  Created by nayan.khadase on 06/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var size: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
