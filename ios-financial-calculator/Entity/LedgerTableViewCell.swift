//
//  LedgerTableViewCell.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class LedgerTableViewCell: UITableViewCell {
    
    // mapping UI with code
    @IBOutlet weak var ledgerText: UILabel!
    @IBOutlet weak var ledgerType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // generated function for selected set
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // generated function for layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
