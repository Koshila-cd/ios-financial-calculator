//
//  MortgagePaymentUIView.swift
//  ios-financial-calculator
//
//  Created by KOshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let MORTGAGE_PAYMENT = "MORTGAGE_PAYMENT"

class MortgagePaymentUIView: UIView {
    
    

    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var interestFld: UITextField!
    @IBOutlet weak var noOfYearsFld: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var mortgageLabel: UILabel!
    @IBOutlet weak var futureValueLbl: UILabel!
    
    var loanAmount: Double = 0
    var interestRate: Double = 0
    var numOfYears: Int = 0
    var mortgage: Double = 0
    
    @IBAction func calculateMortgage(_ sender: UIButton) {
        
        
        
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
        
        if let input = interestFld.text {
            if input.isEmpty {
                validation = false
                interestFld.showErr()
            } else {
                if let value = Double(input as String) {
                    interestRate = value
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
        
        if let input = noOfYearsFld.text {
            if input.isEmpty {
                validation = false
                noOfYearsFld.showErr()
            } else {
                if let value = Int(input as String) {
                    numOfYears = value
                    noOfYearsFld.success()
                }else{
                    validation = false
                    noOfYearsFld.showErr()
                }
            }
        }else{
            validation = false
            noOfYearsFld.showErr()
            
        }
        
        // calculate mortgae if all the fields in the view are not empty and is valid
        if validation {
            mortgage = mortgageFormulae(loanAmount: loanAmount, interestRate: interestRate, numOfYears: numOfYears)
            mortgageLabel.text = "£" + String(format:"%.2f", mortgage)
            
            let futureValue = mortgage * 12 * Double(numOfYears)
            futureValueLbl.text = "£" + String(format:"%.2f", futureValue)
            
            
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
    func mortgageFormulae(loanAmount: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        var mortgage: Double = 0.0
        
        let r = interestRate * (1 / 100)
        let t = Double(numOfYears)
        
        let formulae1: Double = loanAmount * (r / 12)
        
        let formulae2: Double = pow((1 + (r / 12)), 12 * t)
        
        mortgage = (formulae1 * formulae2)/(formulae2 - 1)
        print(mortgage)
        
        return mortgage
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        let saveMortgage: String = "Loan Amount: \(loanAmount) , Interest Rate: \(interestRate) , Loan Terms: \(numOfYears), Payment Amount : \(mortgage)"
        print(saveMortgage)
        var arr = UserDefaults.standard.array(forKey: MORTGAGE_PAYMENT) as? [String] ?? []
        arr.append(saveMortgage)
        UserDefaults.standard.set(arr, forKey: MORTGAGE_PAYMENT)
        
        let alert = UIAlertController(title: "Success", message: "The mortgage calculation was successully saved!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
        
    }
    
    

}
