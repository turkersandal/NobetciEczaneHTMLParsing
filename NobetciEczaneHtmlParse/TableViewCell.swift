//
//  TableViewCell.swift
//  NobetciEczaneHtmlParse
//
//  Created by Türker Sandal on 21.05.2019.
//  Copyright © 2019 Türker Sandal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var ad: UILabel!
    @IBOutlet weak var ilce: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
