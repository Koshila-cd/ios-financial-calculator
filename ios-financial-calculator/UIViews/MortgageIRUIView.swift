//
//  MortgageIRUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let MORTGAGE_INTEREST = "MORTGAGE_INTEREST"
class MortgageIRUIView: UIView {


    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var paymentFld: UITextField!
    @IBOutlet weak var loanTermsFld: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var interestLbl: UILabel!
    
    var loanAmount: Double = 0
    var payment: Double = 0
    var numOfYears: Int = 0
    var interestRate: Double = 0
    
    @IBAction func calculateInterestRate(_ sender: UIButton) {
        
        
        
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
        
        if let input = paymentFld.text {
            if input.isEmpty {
                validation = false
                paymentFld.showErr()
            } else {
                if let value = Double(input as String) {
                    payment = value
                    paymentFld.success()
                }else{
                    validation = false
                    paymentFld.showErr()
                }
            }
        }else{
            validation = false
            paymentFld.showErr()
        }
        
        if let input = loanTermsFld.text {
            if input.isEmpty {
                validation = false
                loanTermsFld.showErr()
            } else {
                if let value = Int(input as String) {
                    numOfYears = value
                    loanTermsFld.success()
                }else{
                    validation = false
                    loanTermsFld.showErr()
                }
            }
        }else{
            validation = false
            loanTermsFld.showErr()
            
        }
        
        // calculate mortgae if all the fields in the view are not empty and is valid
        if validation {
            interestRate = interestRateFormulae(loanAmount: loanAmount, payment: payment, numOfYears: numOfYears)
            interestLbl.text = String(format:"%.2f", interestRate) + "%"
            
            
            // Save button is enabled and made visible with colours
            saveBtn.isEnabled = true
            saveBtn.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.47, alpha:1.0)
            saveBtn.layer.cornerRadius = 15
            
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
    func interestRateFormulae(loanAmount: Double, payment: Double, numOfYears: Int)-> Double
    {
        
        var interestRate: Double = 0.0

        interestRate = ((payment * 12) / loanAmount) * 100
        print(interestRate)
        
        return interestRate
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Loan Amount: \(loanAmount) , Payment: \(payment) , Loan Terms: \(numOfYears), Interest Rate : \(interestRate)"
        print(save)
        var arr = UserDefaults.standard.array(forKey: MORTGAGE_INTEREST) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: MORTGAGE_INTEREST)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert()
    }
    
}
