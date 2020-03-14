//
//  SavingsDepositViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

@objcMembers class SavingsDepositViewController: UIViewController {

    @IBOutlet weak var paymentFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        self.view.addNegativeButtonOnKeyboard(field: paymentFld)
    }
    
    
    
}

//class NegativeButton {
//    @objc func doneButtonAction(){
//        print("donee buttooonnnn")
//        //            paymentFld.text = "-"
//    }
//}
