//
//  FutureValueUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/10/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let LOAN_FUTURE_VALUE = "LOAN_FUTURE_VALUE"

class FutureValueUIView: UIView {
    
    @IBOutlet weak var amountFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    
    @IBOutlet weak var futureValueLbl: UILabel!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    var amount: Double = 0
    var interestRate: Double = 0
    var numOfYears: Int = 0
    var futureValue: Double = 0
    
    /**
     - Get values from textfields in the View and pass them into the formulae for future value calculation
     */
    @IBAction func calculateFutureValue(_ sender: UIButton) {
        
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
        
        // calculate payment if all the fields in the view are not empty and is valid
        if validation {
            futureValue = futureValueFormulae(loanAmount: amount, interestRate: interestRate, numOfYears: numOfYears)
            futureValueLbl.text = "£" + String(format:"%.2f", futureValue)
            
            saveBtn.isEnabled = true
            saveBtn.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.47, alpha:1.0)
            saveBtn.layer.cornerRadius = 15
        }
        
        
    }
    
    
    /**
     - Calculate future value in given interest rate, loan amount and the number of months it is been payed by passing them to the payment formulae
     - parameters:
     - loanAmount: The amount loaned
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func futureValueFormulae(loanAmount: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var value: Double = 0.0
        
        let n = 12 * Double(numOfYears)
        let interest = interestRate * (1 / 100)
        
        value = loanAmount * pow((1 + interest),n)
        print(value)
        
        return value
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Loan#Loan Amount: \(amount) , Interest Rate: \(interestRate) , Loan Terms: \(numOfYears), Future Value : \(futureValue)"
        
        var arr = UserDefaults.standard.array(forKey: LOAN_FUTURE_VALUE) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: LOAN_FUTURE_VALUE)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
}
