//
//  LoanViewController.swift
//  ios-financial-calculator
//
//  Created by IIT on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

//extension UIView {
//    @discardableResult
//    func applyGradientLoan(colours: [UIColor]) -> CAGradientLayer {
//        return self.applyGradient(colours: colours, locations: nil)
//    }
//
//    @discardableResult
//    func applyGradientLoan(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = self.bounds
//        gradient.colors = colours.map { $0.cgColor }
//        gradient.locations = locations
//        self.layer.insertSublayer(gradient, at: 0)
//        return gradient
//    }
//}

class LoanViewController: UIViewController {

    @IBOutlet weak var segmentView: UIView!
    
    var interestView: UIView!
    var futureValueView: UIView!
    var presentValueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
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
            segmentView.bringSubviewToFront(presentValueView)
            break
        case 1:
            segmentView.bringSubviewToFront(futureValueView)
            break
        case 2:
            segmentView.bringSubviewToFront(interestView)
            break
        default:
            break
        }
    }
}
