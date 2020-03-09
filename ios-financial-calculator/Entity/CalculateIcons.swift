//
//  CalculateIcons.swift
//  ios-financial-calculator
//
//  Created by IIT on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class CalculateIcons {

    let name: String
    let icon: UIImage
    let segueID: String
    let cellColour: UIColor
    
    
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
