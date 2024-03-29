//
//  LoanViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class LoanViewController: UIViewController {
    
    @IBOutlet weak var segmentView: UIView!
    
    var paymentView: UIView!
    var interestView: UIView!
    var futureValueView: UIView!
    var presentValueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply brackground color
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        paymentView = PresentValueViewController().view
        interestView = CalculateInterestViewController().view
        futureValueView = FutureValueViewController().view
        presentValueView = LoanPresentValueViewController().view
        
        // adding sub views into segments in compound savings
        segmentView.addSubview(paymentView)
        segmentView.addSubview(interestView)
        segmentView.addSubview(futureValueView)
        segmentView.addSubview(presentValueView)    
        
    }
    
    // adding segment views into segments in compound savings
    @IBAction func calSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentView.bringSubviewToFront(presentValueView)
            break
        case 1:
            segmentView.bringSubviewToFront(futureValueView)
            break
        case 2:
            segmentView.bringSubviewToFront(interestView)
            break
        case 3:
            segmentView.bringSubviewToFront(paymentView)
            break
        default:
            break
        }
    }
}
