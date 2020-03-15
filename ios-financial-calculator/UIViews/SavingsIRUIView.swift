//
//  SavingsIRUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let SAVINGS_INTEREST = "SAVINGS_INTEREST"

class SavingsIRUIView: UIView {
    
    @IBOutlet weak var paymentFld: UITextField!
    @IBOutlet weak var futureValueFld: UITextField!
    @IBOutlet weak var loanTermsFld: UITextField!
    @IBOutlet weak var interestLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    var payment: Double = 0
    var futureValue: Double = 0
    var numOfYears: Int = 0
    var interestRate: Double = 0
    
    @IBAction func calculateInterestRate(_ sender: UIButton) {
        
        var validation: Bool = true
        
        
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
            interestRate = interestFormulae(payment: payment, futureValue: futureValue, numOfYears: numOfYears)
            interestLbl.text = "£" + String(format:"%.2f", interestRate)
            
            saveBtn.isEnabled = true
            saveBtn.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.47, alpha:1.0)
            saveBtn.layer.cornerRadius = 15
        }
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Savings#Payment: \(payment) , Future Value: \(futureValue) , Loan Terms: \(numOfYears), Interest Rate : \(interestRate)"
        print(save)
        var arr = UserDefaults.standard.array(forKey: SAVINGS_INTEREST) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: SAVINGS_INTEREST)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
    
    /**
     - Calculate future value in given interest rate, loan amount and the number of months
     - it is been payed by passing them to the mortgage formulae
     - parameters:
     - loanAmount: The amount loaned
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func interestFormulae(payment: Double, futureValue: Double, numOfYears: Int)-> Double
    {
        
        var value: Double = 0.0
        
        let interest = interestRate * (1 / 100)
        let t = Double(numOfYears)
        
        let formulae1 = pow(1 + (interest / 12), (12 * t))
        
        value = payment * formulae1
        print(value)
        
        return value
        
    }
    
    
    
}
