//
//  LoanTermsUIView.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/10/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

let COMPOUND_LOAN_TERMS = "COMPOUND_PRESENT_VALUE"

class LoanTermsUIView: UIView {
    
    // mapping UI with code
    @IBOutlet weak var futureValueFld: UITextField!
    @IBOutlet weak var interestRateFld: UITextField!
    @IBOutlet weak var principleAmountFld: UITextField!
    @IBOutlet weak var loanTermsLbl: UILabel!   
    @IBOutlet weak var saveBtn: UIButton!
    
    // value initialization
    var futureValue: Double = 0
    var interestRate: Double = 0
    var principleAmount: Double = 0   
    var value: Double = 0
    
    /**
     - Get values from textfields in the View and pass them into the formulae for loan terms calculation
     */
    @IBAction func calculateLoanterms(_ sender: UIButton) {
        
        
        // validation is true when text fields are not empty and is string values are not added
        var validation: Bool = true
        
        if let input = futureValueFld.text {
            if input.isEmpty {
                validation = false
                futureValueFld.showErr()
            } else {
                if let value = Double(input as String) {
                    futureValue = value
                    futureValueFld.success()
                }else{
                    validation = false
                    futureValueFld.showErr()
                }
            }
        }else{
            validation = false
            futureValueFld.showErr()
        }
        
        // interest field validation
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
        
        // principle amount validation
        if let input = principleAmountFld.text {
            if input.isEmpty {
                validation = false
                principleAmountFld.showErr()
            } else {
                if let value = Double(input as String) {
                    principleAmount = value
                    principleAmountFld.success()
                }else{
                    validation = false
                    principleAmountFld.showErr()
                }
            }
        }else{
            validation = false
            principleAmountFld.showErr()
            
        }
        
        // calculate mortgae if all the fields in the view are not empty and is valid
        if validation {
            value = loanTermsFormulae(futureValue: futureValue, interestRate: interestRate, principleAmount: principleAmount)
            loanTermsLbl.text =  String(value) + "Years"
            
            // add changes to save button when the calculation is done
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
    func loanTermsFormulae(futureValue: Double, interestRate: Double, principleAmount: Double)-> Double
    {
        
        var value1: Double = 0.0
        
        
        //        compoundInterest =
        //        print(loanTerms)
        //
        return value1
        
    }
    
    /**
     - Save button, saving the calculated amount and the fileds into userdefaults
     - A success message alert will appear one the saving is completed
     - parameters:
     -  sender: The navigation button item.
     */
    @IBAction func save(_ sender: UIButton) {
        let save: String = "Compund Interest#Future Value: \(futureValue) , Interest Rate: \(interestRate) , Principle Amount: \(principleAmount), Compund Interest: \(value)"
        
        var arr = UserDefaults.standard.array(forKey: COMPOUND_PRESENT_VALUE) as? [String] ?? []
        arr.append(save)
        UserDefaults.standard.set(arr, forKey: COMPOUND_PRESENT_VALUE)
        
        saveBtn.isEnabled = false
        SaveSuccess.instance.showAlert(text: "The calculation is Successfully saved!")
    }
    
    
}
