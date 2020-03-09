//
//  MortgageViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class MortgageViewController: UIViewController {
    
    
    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var interestFld: UITextField!
    @IBOutlet weak var noOfYearsFld: UITextField!
    @IBOutlet weak var paymentLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        paymentLbl.text = "-"
        
    }
    
    /**
     - Get values from textfields in the View and pass them into the mortgage formulae for calculation
     */
    @IBAction func calculateMortgage(_ sender: UIButton) {
        
        var loanAmount: Double = 0
        var interestRate: Double = 0
        var numOfYears: Int = 0
        
        var validation: Bool = true
        
        if let input = loanAmountFld.text {
            if input.isEmpty {
                validation = false
//                loanAmountFld.showEr÷\r()
            } else {
                if let value = Double(input as String) {
                    loanAmount = value
//                    loanAmountFld.success()
                }else{
                    validation = false
//                    loanAmountFld.showErr()
                }
            }
        }else{
            validation = false
//            loanAmountFld.showErr()
        }
        
        if let input = interestFld.text {
            if input.isEmpty {
                validation = false
//                interestFld.showErr()
            } else {
                if let value = Double(input as String) {
                    interestRate = value
//                    interestFld.success()
                }else{
                    validation = false
//                    interestFld.showErr()
                }
            }
        }else{
            validation = false
//            interestFld.showErr()
        }
        
        if let input = noOfYearsFld.text {
            if input.isEmpty {
                validation = false
//                noOfYearsFld.showErr()
            } else {
                if let value = Int(input as String) {
                    numOfYears = value
//                    noOfYearsFld.success()
                }else{
                    validation = false
//                    noOfYearsFld.showErr()
                }
            }
        }else{
            validation = false
//            noOfYearsFld.showErr()
            
        }
        
        // calculate mortgae if all the fields in the view are not empty and is valid
        if validation {
            let mortgage = mortgageFormulae(loanAmount: loanAmount, interestRate: interestRate, numOfYears: numOfYears)
            paymentLbl.text = "£" + String(format:"%.2f", mortgage)
        }
        
        
    }
    
    
    /**
     - Calculate amount payable in given interest rate, loan amount and the number of months
     - it is been payed by passing them to the mortgage formulae
     - parameters:
     - loanAmount: The amount loaned
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func mortgageFormulae(loanAmount: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var mortgage: Double = 0.0
        
        // number of months calculated from the given number of years
        let n = Double(12 * numOfYears)
        let t = Double(numOfYears)
//        let formulae1: Double = ((loanAmount*n)+interestRate)/n
        let formulae1: Double = loanAmount*(interestRate/n)
        
        let formulae2: Double = pow((1+(interestRate/n)),n*t)
        
        mortgage = (formulae1 * formulae2)/(formulae2 - 1)
        print(mortgage)
        
        return mortgage
        
    }
    
    
}
