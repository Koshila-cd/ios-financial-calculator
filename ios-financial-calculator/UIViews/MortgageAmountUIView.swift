//
//  MortgageAmountUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let MORTGAGE_AMOUNT = "MORTGAGE_AMOUNT"

class MortgageAmountUIView: UIView {
    
    @IBOutlet weak var paymentFld: UITextField!
    @IBOutlet weak var interestFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var amountLbl: UILabel!
    
    var payment: Double = 0
    var interest: Double = 0
    var numOfYears: Int = 0
    var amount: Double = 0
    
    @IBAction func calculateAmount(_ sender: UIButton) {
        
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
        
        if let input = interestFld.text {
            if input.isEmpty {
                validation = false
                interestFld.showErr()
            } else {
                if let value = Double(input as String) {
                    interest = value
                    interestFld.success()
                }else{
                    validation = false
                    interestFld.showErr()
                }
            }
        }else{
            validation = false
            interestFld.showErr()
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
        if validation {
            amount = amountFormulae(payment: payment, interest: interest, numOfYears: numOfYears)
            amountLbl.text = "£" + String(format:"%.2f", amount)
            
            saveBtn.isEnabled = true
            saveBtn.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.47, alpha:1.0)
            saveBtn.layer.cornerRadius = 15
        }
        
        
    }
    
    /**
     - Save button, saving the calculated amount and the fileds into userdefaults
     - A success message alert will appear one the saving is completed
     - parameters:
     -  sender: The navigation button item.
     */
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Mortgage#Payment: \(payment) , Interest Rate: \(interest) , Loan Terms: \(numOfYears), Payment Amount : \(amount)"
        print(save)
        var arr = UserDefaults.standard.array(forKey: MORTGAGE_AMOUNT) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: MORTGAGE_AMOUNT)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
    
    /**
     - Calculate amount payable in given interest rate, loan amount and the number of months
     - it is been payed by passing them to the mortgage formulae
     - parameters:
     - loanAmount: The amount loaned
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func amountFormulae(payment: Double, interest: Double, numOfYears: Int)-> Double
    {
        
        var amount: Double = 0.0
        
        let interestRate = interest * (1 / 100)
        let formulae1 = pow((1 + (interestRate / 12)),(12 * Double(numOfYears)))
        
        amount = (payment * 12 * (formulae1 - 1)) / (interestRate * formulae1)
        print(amount)
        
        return amount
        
    }
    
    
}
