//
//  LoanPresentValue.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/15/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let LOAN_PRESENT_VALUE = "LOAN_PRESENT_VALUE"

class LoanPresentValue: UIView {


    @IBOutlet weak var futureValueFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    
    @IBOutlet weak var presentValueFld: UILabel!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    var futureValue: Double = 0
    var interestRate: Double = 0
    var numOfYears: Int = 0
    var value: Double = 0
    
    @IBAction func calculateValue(_ sender: UIButton) {
        
        
        
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
            value = paymentFormulae(futureValue: futureValue, interestRate: interestRate, numOfYears: numOfYears)
            presentValueFld.text = "£" + String(format:"%.2f", value)
            
            saveBtn.isEnabled = true
            saveBtn.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.47, alpha:1.0)
            saveBtn.layer.cornerRadius = 15
        }
        
        
    }
    
    
    /**
     - Calculate amount payable in given interest rate, loan amount and the number of months it is been payed by passing them to the payment formulae
     - parameters:
     - loanAmount: The amount loaned
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func paymentFormulae(futureValue: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var value: Double = 0.0
        
        let n = 12 * Double(numOfYears)
        let interest = interestRate * (1 / 100)
        
        let formulae1 = pow((1 + interest), n)
        
        value = futureValue / formulae1
        print(value)
        
        return value
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Loan#Future Value: \(futureValue) , Interest Rate: \(interestRate) , Loan Terms: \(numOfYears), Interest Rate : \(interestRate)"
        
        var arr = UserDefaults.standard.array(forKey: LOAN_PRESENT_VALUE) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: LOAN_PRESENT_VALUE)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
}
