//
//  FutureValueUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/10/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class FutureValueUIView: UIView {

    @IBOutlet weak var amountFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    
    @IBOutlet weak var futureValueLbl: UILabel!
    
    /**
     - Get values from textfields in the View and pass them into the formulae for future value calculation
     */
    @IBAction func calculateFutureValue(_ sender: UIButton) {
        
        var amount: Double = 0
        var interestRate: Double = 0
        var numOfYears: Int = 0
        
        var validation: Bool = true
        
        if let input = amountFld.text {
            if input.isEmpty {
                validation = false
                amountFld.showErr()
            } else {
                if let value = Double(input as String) {
                    amount = value
                    amountFld.success()
                }else{
                    validation = false
                    amountFld.showErr()
                }
            }
        }else{
            validation = false
            amountFld.showErr()
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
        
        // calculate mortgae if all the fields in the view are not empty and is valid
//        if validation {
//            let loanTerms = loanTermsFormulae(futureValue: futureValue, interestRate: interestRate, principleAmount: principleAmount)
//            loanTermsLbl.text =  String(loanTerms) + "Years"
//        }
        
    }
    
}
