//
//  PresentValueCIUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/10/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let COMPOUND_PRESENT_VALUE = "COMPOUND_PRESENT_VALUE"

class PresentValueCIUIView: UIView {
    
    @IBOutlet weak var totalAmountFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    var totalAmount: Double = 0
    var interestRate: Double = 0
    var numOfYears: Int = 0
    
    var amount: Double = 0
    
    /**
     - Get values from textfields in the View and pass them into the formulae for calculating the principle amount
     */
    @IBAction func calculateAmount(_ sender: UIButton) {
        
        var validation: Bool = true
        
        if let input = totalAmountFld.text {
            if input.isEmpty {
                validation = false
                totalAmountFld.showErr()
            } else {
                if let value = Double(input as String) {
                    totalAmount = value
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
        if validation {
            amount = principleAmountFormulae(totalAmount: totalAmount, interestRate: interestRate, numOfYears: numOfYears)
            amountLbl.text = "£" + String(format:"%.2f", amount)
            
            saveBtn.isEnabled = true
            saveBtn.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.47, alpha:1.0)
            saveBtn.layer.cornerRadius = 15
        }
        
    }
    
    /**
     - Calculate initial amount from given interest rate, loan amount and the number of months
     - it is been payed by passing them to the mortgage formulae
     - parameters:
     - loanAmount: The amount loaned
     - interestRate: The interest rate
     - numOfYears: The number of years when the payment is complete
     */
    func principleAmountFormulae(totalAmount: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var amount: Double = 0.0
        
        // number of months calculated from the given number of years
        let n = Double(12 * numOfYears)
        let t = Double(numOfYears)
        
        
        amount = totalAmount/pow((1 + (interestRate/n)),n*t)
        
        print(amount)
        
        return amount
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Compund Interest#Future Value: \(totalAmount) , Interest Rate: \(interestRate) , Loan Terms: \(numOfYears), Interest Rate : \(interestRate)"
        
        var arr = UserDefaults.standard.array(forKey: COMPOUND_PRESENT_VALUE) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: COMPOUND_PRESENT_VALUE)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
}
