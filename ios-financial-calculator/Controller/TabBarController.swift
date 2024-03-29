//
//  TabBarController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }   
}

/**
 - Error and success validations in fields
 - Errors show red boarders in fields
 */
extension UIView{
    func showErr(){
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 3
    }
    
    func success() {
        self.layer.borderColor = UIColor.lightText.cgColor
        self.layer.borderWidth = 0
    }
}
