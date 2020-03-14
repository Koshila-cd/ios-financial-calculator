//
//  LoanPaymentUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let COMPOUND_LOAN = "COMPOUND_LOAN"
class LoanPaymentUIView: UIView {

    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var paymentLbl: UILabel!
    
    /**
     - Get values from textfields in the View and pass them into the payment formulae for calculation
     */
    @IBAction func calculatePayment(_ sender: UIButton) {
        var loanAmount: Double = 0
        var interestRate: Double = 0
        var numOfYears: Int = 0
        
        var validation: Bool = true
        
        if let input = loanAmountFld.text {
            if input.isEmpty {
                validation = false
                loanAmountFld.showErr()
            } else {
                if let value = Double(input as String) {
                    loanAmount = value
                    loanAmountFld.success()
                }else{
                    validation = false
                    loanAmountFld.showErr()
                }
            }
        }else{
            validation = false
            loanAmountFld.showErr()
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
        
        // calculate payment if all the fields in the view are not empty and is valid
        if validation {
            let payment = paymentFormulae(loanAmount: loanAmount, interestRate: interestRate, numOfYears: numOfYears)
            paymentLbl.text = "£" + String(format:"%.2f", payment)
        }
        
        
    }
    
    
    /**
     - Calculate amount payable in given interest rate, loan amount and the number of months it is been payed by passing them to the payment formulae
     - parameters:
     - loanAmount: The amount loaned
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func paymentFormulae(loanAmount: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var payment: Double = 0.0
        
        // number of months calculated from the given number of years
        let n = Double(12 * numOfYears)
        let t = Double(numOfYears)
        
        let formulae1: Double = loanAmount*(interestRate/n)
        
        let formulae2: Double = pow((1+(interestRate/n)),n*t)
        
        payment = (formulae1 * formulae2)/(formulae2 - 1)
        print(payment)
        
        return payment
        
}
}
