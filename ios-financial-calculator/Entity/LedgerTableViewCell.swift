//
//  LedgerTableViewCell.swift
//  ios-financial-calculator
//
//  Created by IIT on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class LedgerTableViewCell: UITableViewCell {

    @IBOutlet weak var ledgerText: UILabel!
    @IBOutlet weak var ledgerType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }

}
