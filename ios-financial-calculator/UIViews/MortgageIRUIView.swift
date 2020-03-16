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
    
    // mapping UI wuth code
    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var paymentFld: UITextField!
    @IBOutlet weak var loanTermsFld: UITextField!
    @IBOutlet weak var saveBtn: UIButton!  
    @IBOutlet weak var interestLbl: UILabel!
    
    // value initialization
    var loanAmount: Double = 0
    var payment: Double = 0
    var numOfYears: Int = 0
    var interestRate: Double = 0
    
    /**
     - Get values from textfields in the View and pass them into the formulae for calculating the interest rate
     */
    @IBAction func calculateInterestRate(_ sender: UIButton) {   
        
        // validation is true when text fields are not empty and is string values are not added
        var validation: Bool = true
        
        // loan amount field valdation
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
        
        // payment field valdation
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
        
        // loan terms field valdation
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
            
            
            // save button is enabled and made visible with colours
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
    
    /**
     - Save button, saving the calculated amount and the fileds into userdefaults
     - A success message alert will appear one the saving is completed
     - parameters:
     -  sender: The navigation button item.
     */
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Mortgage#Loan Amount: \(loanAmount) , Payment: \(payment) , Loan Terms: \(numOfYears), Interest Rate : \(interestRate)"
        print(save)
        var arr = UserDefaults.standard.array(forKey: MORTGAGE_INTEREST) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: MORTGAGE_INTEREST)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
}
