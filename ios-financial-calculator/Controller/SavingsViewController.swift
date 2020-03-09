//
//  SavingsViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class SavingsViewController: UIViewController {

    
    @IBOutlet weak var pmtFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var savingLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
    }
    
    /**
     - Get values from textfields in the View and pass them into the savings formulae for calculation
     */
    @IBAction func calculateSavings(_ sender: UIButton) {
        
        var pmt: Double = 0
        var interestRate: Double = 0
        var numOfYears: Int = 0
        
        var validation: Bool = true
        
        // input field validation for empty fields and non Double values
        if let input = pmtFld.text {
            if input.isEmpty {
                validation = false
                pmtFld.showErr()
            } else {
                if let value = Double(input as String) {
                    pmt = value
                    pmtFld.success()
                }else{
                    validation = false
                    pmtFld.showErr()
                }
            }
        }else{
            validation = false
            pmtFld.showErr()
        }
        
        if let input = interestRateFld.text {
            if input.isEmpty {
                validation = false
                interestRateFld.showErr()
            } else {
                if let value = Double(input as String) {
                    interestRate = value
                    interestRateFld.success()
                }else{
                    validation = false
                    interestRateFld.showErr()
                }
            }
        }else{
            validation = false
            interestRateFld.showErr()
        }
        
        if let input = numOfYearsFld.text {
            if input.isEmpty {
                validation = false
                numOfYearsFld.showErr()
            } else {
                if let value = Int(input as String) {
                    numOfYears = value
                    numOfYearsFld.success()
                }else{
                    validation = false
                    numOfYearsFld.showErr()
                }
            }
        }else{
            validation = false
            numOfYearsFld.showErr()
            
        }
        
        // calculate savings if all the fields in the view are not empty and is valid
        if validation {
            let savings = savingsFormulae(pmt: pmt, interestRate: interestRate, numOfYears: numOfYears)
            savingLbl.text = "£" + String(format:"%.2f", savings)
        }
        
    }
    
    /**
     - Calculate savings from given interest rate, monthly payment amount and the number of months it is been payed by passing them to the mortgage formulae
     - parameters:
     - pmt: The monthly payment amount
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func savingsFormulae(pmt: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var savings: Double = 0.0
        
        let t = Double(numOfYears)

        let formulae1: Double = pow((1 + (interestRate / 12)),12 * t)

        savings = pmt * ((formulae1 - 1)/(interestRate/12))
        print(savings)
        
        return savings
        
    }
    
}
