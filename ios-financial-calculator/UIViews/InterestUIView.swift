//
//  InterestUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let COMPUNT_INTEREST = "COMPUNT_INTEREST"

class InterestUIView: UIView {


    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var totalAmountFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var interestLbl: UILabel!
    
    var loanAmount: Double = 0
    var totalAmount: Double = 0
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
                interest = interestFormulae(loanAmount: loanAmount, totalAmount: totalAmount, numOfYears: numOfYears)
                interestLbl.text = String(format:"%.2f", interest) + "%"
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
    func interestFormulae(loanAmount: Double, totalAmount: Double, numOfYears: Int)-> Double
    {
        
        var interest: Double = 0.0
        
        // number of months calculated from the given number of years
        let n = Double(12 * numOfYears)
        let t = Double(numOfYears)
        
        let formulae1: Double = pow((totalAmount/loanAmount),(1/(12*t)))
        
        interest = n*(formulae1 - 1)
        print(interest)
        
        return interest
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        print("saveee")
        let save: String = "Loan Amount: \(loanAmount) , Total Amount: \(totalAmount) , Loan Terms: \(numOfYears), Interest Rate : \(interest)"

        var arr = UserDefaults.standard.array(forKey: COMPUNT_INTEREST) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: COMPUNT_INTEREST)
        
        let alert = UIAlertController(title: "Success", message: "The calculation was successully saved!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //                    self.present(alert, animated: true, completion: nil)
    }
    
}
