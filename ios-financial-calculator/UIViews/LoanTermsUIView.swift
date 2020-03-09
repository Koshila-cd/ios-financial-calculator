//
//  LoanTermsUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/10/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class LoanTermsUIView: UIView {

    @IBOutlet weak var futureValueFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var principleAmountFld: UITextField!
    @IBOutlet weak var loanTermsLbl: UILabel!
    
    /**
     - Get values from textfields in the View and pass them into the formulae for loan terms calculation
     */
    @IBAction func calculateLoanterms(_ sender: UIButton) {
        
        var futureValue: Double = 0
        var interestRate: Double = 0
        var principleAmount: Double = 0
        
        var validation: Bool = true
        
        if let input = futureValueFld.text {
            if input.isEmpty {
                validation = false
                futureValueFld.showErr()
            } else {
                if let value = Double(input as String) {
                    futureValue = value
                    futureValueFld.success()
                }else{
                    validation = false
                    futureValueFld.showErr()
                }
            }
        }else{
            validation = false
            futureValueFld.showErr()
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
        
        if let input = principleAmountFld.text {
            if input.isEmpty {
                validation = false
                principleAmountFld.showErr()
            } else {
                if let value = Double(input as String) {
                    principleAmount = value
                    principleAmountFld.success()
                }else{
                    validation = false
                    principleAmountFld.showErr()
                }
            }
        }else{
            validation = false
            principleAmountFld.showErr()
            
        }
        
        // calculate mortgae if all the fields in the view are not empty and is valid
        if validation {
            let loanTerms = loanTermsFormulae(futureValue: futureValue, interestRate: interestRate, principleAmount: principleAmount)
            loanTermsLbl.text =  String(loanTerms) + "Years"
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
    func loanTermsFormulae(futureValue: Double, interestRate: Double, principleAmount: Double)-> Double
    {
        
        var loanTerms: Double = 0.0
        
        
//        compoundInterest =
        print(loanTerms)
        
        return loanTerms
        
    }
    
    
}
