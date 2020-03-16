//
//  SavingsIRViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class SavingsIRViewController: UIViewController {
    
    @IBOutlet weak var paymentFld: UITextField!
    
    @IBOutlet weak var futureValueFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply background color
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        // apply negative button on some fields
        self.view.addNegativeButtonOnKeyboard(field: paymentFld)
        self.view.addNegativeButtonOnKeyboard(field: futureValueFld)
    }
    
}
