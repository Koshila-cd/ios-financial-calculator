//
//  SavingsDepositUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let SAVINGS_DEPOSIT = "SAVINGS_DEPOSIT"

class SavingsDepositUIView: UIView {
    
    // mapping UI to code
    @IBOutlet weak var paymentFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var depositeLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    // value initialization
    var payment: Double = 0
    var interestRate: Double = 0
    var numOfYears: Int = 0
    var deposit: Double = 0
    
    @IBAction func calculateDeposit(_ sender: UIButton) {

        // validation is true when text fields are not empty and is string values are not added
        var validation: Bool = true
        
        // loan payment field validation
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
        
        // interest rate field validation
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
        
        // loan terms field validation
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
            deposit = depositFormulae(payment: payment, interestRate: interestRate, numOfYears: numOfYears)
            depositeLbl.text = "£" + String(format:"%.2f", deposit)
            
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
        let save: String = "Savings#Payment: \(payment) , Interest Rate: \(interestRate) , Loan Terms: \(numOfYears), Deposit Amount : \(deposit)"
        print(save)
        var arr = UserDefaults.standard.array(forKey: SAVINGS_DEPOSIT) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: SAVINGS_DEPOSIT)
        
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
    func depositFormulae(payment: Double, interestRate: Double, numOfYears: Int)-> Double
    {

        var deposit: Double = 0.0
        
        let interest = interestRate * (1 / 100)
        let t = Double(numOfYears)
        
        let formulae1 = pow(1 + (interest / 12), (12 * t))
        
        deposit = payment * formulae1
        print(deposit)
        
        return deposit
        
    }
    
    
}
