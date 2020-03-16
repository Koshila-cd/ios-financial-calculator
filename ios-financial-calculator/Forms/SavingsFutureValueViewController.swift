//
//  SavingsFutureValueViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 Koshila Dissanayake. All rights reserved.
//

import UIKit

class SavingsFutureValueViewController: UIViewController {
    
    
    @IBOutlet weak var paymentFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply background color
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        // apply negative button on keyboard
        self.view.addNegativeButtonOnKeyboard(field: paymentFld)
        
    }
    
}
