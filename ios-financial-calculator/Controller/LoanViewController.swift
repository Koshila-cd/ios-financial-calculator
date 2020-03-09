//
//  LoanViewController.swift
//  ios-financial-calculator
//
//  Created by IIT on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class LoanViewController: UIViewController {

    @IBOutlet weak var segmentView: UIView!
    
    var interestView: UIView!
    var futureValueView: UIView!
    var presentValueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interestView = CalculateInterestViewController().view
        futureValueView = FutureValueViewController().view
        presentValueView = PresentValueViewController().view
        
        segmentView.addSubview(interestView)
        segmentView.addSubview(futureValueView)
        segmentView.addSubview(presentValueView)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func calSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentView.bringSubviewToFront(interestView)
            break
        case 1:
            segmentView.bringSubviewToFront(futureValueView)
            break
        case 2:
            segmentView.bringSubviewToFront(presentValueView)
            break
        default:
            break
        }
    }
}
