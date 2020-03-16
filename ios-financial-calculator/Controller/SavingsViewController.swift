//
//  SavingsViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class SavingsViewController: UIViewController {
    
    var futureValue: UIView!
    var interestRate: UIView!
    var payment: UIView!
    
    @IBOutlet weak var segmentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply brackground color
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        futureValue = SavingsFutureValueViewController().view
        interestRate = SavingsIRViewController().view
        payment = SavingsDepositViewController().view
        
        // adding sub views into segments in compound savings
        segmentView.addSubview(futureValue)
        segmentView.addSubview(interestRate)
        segmentView.addSubview(payment)
        
    }
    
    // adding segment views into segments in compound savings
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentView.bringSubviewToFront(payment)
            break
        case 1:
            segmentView.bringSubviewToFront(interestRate)
            break
        case 2:
            segmentView.bringSubviewToFront(futureValue)
            break
        default:
            break
        }
    }
    
    
    
}
