//
//  MortgageViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class MortgageViewController: UIViewController {
    
    var payment: UIView!
    var interestRate: UIView!
    var mortgageAmount: UIView!

    @IBOutlet weak var segmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        
        payment = MortgagePaymentViewController().view
        interestRate = MortgageIRViewController().view
        mortgageAmount = MortgageAmountViewController().view
        
        segmentView.addSubview(payment)
        segmentView.addSubview(interestRate)
        segmentView.addSubview(mortgageAmount)
        
    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentView.bringSubviewToFront(mortgageAmount)
            break
        case 1:
            segmentView.bringSubviewToFront(interestRate)
            break
        case 2:
            segmentView.bringSubviewToFront(payment)
            break
        default:
            break
        }
    }
    
}
