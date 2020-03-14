//
//  MortgageIRUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class MortgageIRUIView: UIView {


    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var paymentFld: UITextField!
    @IBOutlet weak var loanTermsFld: UITextField!
    
    @IBOutlet weak var interestLbl: UILabel!
    
    
    @IBAction func calculateInterestRate(_ sender: UIButton) {
        
        var loanAmount: Double = 0
        var payment: Double = 0
        var numOfYears: Int = 0
        
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
            let interestRate = interestRateFormulae(loanAmount: loanAmount, payment: payment, numOfYears: numOfYears)
            interestLbl.text = String(format:"%.2f", interestRate) + "%"
            
            
            //            let saveMortgage: String = "Loan Amount: \(loanAmount) , Interest Rate: \(interestRate) , Loan Terms: \(numOfYears), Payment Amount : \(mortgage)"
            //            print(saveMortgage)
            //            var arr = UserDefaults.standard.array(forKey: HISTORY_FORMULAR) as? [String] ?? []
            //            arr.append(saveMortgage)
            //            UserDefaults.standard.set(arr, forKey: HISTORY_FORMULAR)
            //
            //            let alert = UIAlertController(title: "Success", message: "The mortgage calculation was successully saved!", preferredStyle: UIAlertController.Style.alert)
            //            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            //            self.present(alert, animated: true, completion: nil)
            
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
    
}
