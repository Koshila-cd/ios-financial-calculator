//
//  CompundInterestViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/10/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class CompundInterestViewController: UIViewController {
    
    var compundInterestView: UIView!
    var presentValueView: UIView!
    var loanTermsView: UIView!
    
    @IBOutlet weak var segmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        compundInterestView = CalculateCIViewController().view
        presentValueView = PresentValueCIViewController().view
        loanTermsView = LoanTermsViewController().view
        
        segmentView.addSubview(compundInterestView)
        segmentView.addSubview(presentValueView)
        segmentView.addSubview(loanTermsView)
    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentView.bringSubviewToFront(loanTermsView)
            break
        case 1:
            segmentView.bringSubviewToFront(presentValueView)
            break
        case 2:
            segmentView.bringSubviewToFront(compundInterestView)
            break
        default:
            break
        }
        
    }
    
    
    
}
