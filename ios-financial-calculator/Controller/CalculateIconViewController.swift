//
//  CalculateIconViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

extension UIView {

    // this functions is to apply a gradient background to the application
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    // this functions is to apply a gradient background to the application
    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    // this function is to add a negative button to the keyboard when required
    func addNegativeButtonOnKeyboard(field: UITextField){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .black
        
        let done: UIBarButtonItem = UIBarButtonItem(title: "Negative(-)", style: .plain , target: self, action: #selector(negativeButtonAction))
        
        let items = [done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        done.tintColor = UIColor.white
        
        field.inputAccessoryView = doneToolbar
        
    }
    
    @objc func negativeButtonAction(){
        
    }
}

class CalculateIconViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set default styles to home page
        self.savingsBtn.layer.cornerRadius = 15
        self.mortgageBtn.layer.cornerRadius = 15
        self.loansBtn.layer.cornerRadius = 15
        self.comInterestBtn.layer.cornerRadius = 15
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
    }
    
    // initialization of buttons in the home page
    @IBOutlet weak var savingsBtn: UIButton!
    @IBOutlet weak var mortgageBtn: UIButton!
    @IBOutlet weak var loansBtn: UIButton!
    @IBOutlet weak var comInterestBtn: UIButton!
    
    
    
}
