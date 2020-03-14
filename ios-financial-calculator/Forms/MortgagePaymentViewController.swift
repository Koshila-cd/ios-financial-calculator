//
//  MortgagePaymentViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class MortgagePaymentViewController: UIViewController {

    
    @IBAction func saveAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Success", message: "The calculation was successully saved!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
    }

}
