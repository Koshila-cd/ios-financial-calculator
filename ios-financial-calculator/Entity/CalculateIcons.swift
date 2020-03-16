//
//  CalculateIcons.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class CalculateIcons {

    let name: String
    let icon: UIImage
    let segueID: String
    let cellColour: UIColor
    
    /**
     - Home page icons
     - parameters:
     - name: The amount loaned
     - icon: Image of the icon
     - sequeId: The segue Id of the cell
     - cell color: The cell color
     */
    init(name: String, icon: UIImage, segueID: String, cellColour: UIColor) {
        self.name = name
        self.icon = icon
        self.segueID = segueID
        self.cellColour = cellColour
    }
    
    func getCalculateIconName() -> String {
        return name
    }
    
    func getCalculateIcon() -> UIImage {
        return icon
    }
    
    func getSegueID() -> String {
        return segueID
    }
    
    func getCellColour() -> UIColor {
        return cellColour
    }

}
