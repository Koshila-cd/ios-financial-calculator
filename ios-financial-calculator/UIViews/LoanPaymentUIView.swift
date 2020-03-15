//
//  LoanPaymentUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let LOAN_PAYMENT = "LOAN_PAYMENT"
class LoanPaymentUIView: UIView {

    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var paymentLbl: UILabel!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    
    var loanAmount: Double = 0
    var interestRate: Double = 0
    var numOfYears: Int = 0
    var payment: Double = 0
    
    /**
     - Get values from textfields in the View and pass them into the payment formulae for calculation
     */
    @IBAction func calculatePayment(_ sender: UIButton) {
        
        
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
            payment = paymentFormulae(loanAmount: loanAmount, interestRate: interestRate, numOfYears: numOfYears)
            paymentLbl.text = "£" + String(format:"%.2f", payment)
        
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
    func paymentFormulae(loanAmount: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var payment: Double = 0.0

        let n = 12 * Double(numOfYears)
        let interest = interestRate * (1 / 100)
        let formulae1 = pow((1 + interest), -n)
        
        payment = (interest * loanAmount) / (1 - formulae1)
        print(payment)
        
        return payment
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Loan Amount: \(loanAmount) , Interest Rate: \(interestRate) , Loan Terms: \(numOfYears), Payment : \(payment)"
        
        var arr = UserDefaults.standard.array(forKey: LOAN_PAYMENT) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: LOAN_PAYMENT)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert()
    }
}
