//
//  MortgageAmountUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class MortgageAmountUIView: UIView {

    @IBOutlet weak var paymentFld: UITextField!
    @IBOutlet weak var interestFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    
    @IBOutlet weak var amountLbl: UILabel!
    
    
    @IBAction func calculateAmount(_ sender: UIButton) {
        
        var payment: Double = 0
        var interest: Double = 0
        var numOfYears: Int = 0
        
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
            let amount = amountFormulae(payment: payment, interest: interest, numOfYears: numOfYears)
            amountLbl.text = "£" + String(format:"%.2f", amount)
            
            
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
