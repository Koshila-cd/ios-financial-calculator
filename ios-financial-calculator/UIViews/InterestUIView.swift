//
//  InterestUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let LOAN_INTEREST = "LOAN_INTEREST"

class InterestUIView: UIView {


    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var totalAmountFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var interestLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    var loanAmount: Double = 0
    var payment: Double = 0
    var numOfYears: Int = 0
    var interest: Double = 0
    
    /**
     - Get values from textfields in the View and pass them into the interest rate calculation formulae
     */
    @IBAction func calculateInterest(_ sender: UIButton) {
            
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
            
            if let input = totalAmountFld.text {
                if input.isEmpty {
                    validation = false
                    totalAmountFld.showErr()
                } else {
                    if let value = Double(input as String) {
                        payment = value
                        totalAmountFld.success()
                    }else{
                        validation = false
                        totalAmountFld.showErr()
                    }
                }
            }else{
                validation = false
                totalAmountFld.showErr()
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
                interest = interestFormulae(loanAmount: loanAmount, payment: payment, numOfYears: numOfYears)
                interestLbl.text = String(format:"%.2f", interest) + "%"
                
                saveBtn.isEnabled = true
                saveBtn.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.47, alpha:1.0)
                saveBtn.layer.cornerRadius = 15
            }
    }
    
    /**
     - Calculate interest rate
     - it is been payed by passing them to the mortgage formulae
     - parameters:
     - loanAmount: The amount loaned
     - totalAmount: Total loan amount
     - numOfYears: The number of years when the payment is complete
     */
    func interestFormulae(loanAmount: Double, payment: Double, numOfYears: Int)-> Double
    {
        
        var interest: Double = 0.0
        
        // number of months calculated from the given number of years
        let n = 12 * Double(numOfYears)
        
        interest = (payment / (loanAmount * n)) * 100
        print(interest)
        
        return interest
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Loan#Loan Amount: \(loanAmount) , Monthly Payment: \(payment) , Loan Terms: \(numOfYears), Interest Rate : \(interest)"

        var arr = UserDefaults.standard.array(forKey: LOAN_INTEREST) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: LOAN_INTEREST)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
}
