//
//  CalculateIconViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

class CalculateIconViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.savingsBtn.applyGradient(colours: [.yellow, .blue])
        self.savingsBtn.layer.cornerRadius = 15
        self.mortgageBtn.layer.cornerRadius = 15
        self.loansBtn.layer.cornerRadius = 15
        self.comInterestBtn.layer.cornerRadius = 15
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
    }
    

    @IBOutlet weak var savingsBtn: UIButton!
    @IBOutlet weak var mortgageBtn: UIButton!
    @IBOutlet weak var loansBtn: UIButton!
    @IBOutlet weak var comInterestBtn: UIButton!
    

    
}
