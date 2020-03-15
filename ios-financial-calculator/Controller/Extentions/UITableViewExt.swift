//
//  UITableViewExt.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/15/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// This function sets an empty message on the table view.
    func setEmptyMessage(_ message: String,_ messageColour: UIColor) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = messageColour
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "System", size: 18)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    /// This function removes the empty message from the table view.
    func restore() {
        self.backgroundView = nil
    }
}
