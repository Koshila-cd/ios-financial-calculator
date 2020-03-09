//
//  CalculateInterestViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class CalculateInterestViewController: UIViewController {

    
    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var totalAmountFld: UITextField!
    @IBOutlet weak var numOfYearsFld: UITextField!
    @IBOutlet weak var interestLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        totalAmountFld.text = "3333"
        
    }

    /**
     - Get values from textfields in the View and pass them into the interest rate calculation formulae
     */
    @IBAction func calculateInterest(_ sender: UIButton) {
        print("xxxxx")
        
        var loanAmount: Double = 0
        var totalAmount: Double = 0
        var numOfYears: Int = 0
        
        var validation: Bool = true
        
        if let input = loanAmountFld.text {
            if input.isEmpty {
                validation = false
                //                loanAmountFld.showEr÷\r()
            } else {
                if let value = Double(input as String) {
                    loanAmount = value
                    //                    loanAmountFld.success()
                }else{
                    validation = false
                    //                    loanAmountFld.showErr()
                }
            }
        }else{
            validation = false
            //            loanAmountFld.showErr()
        }
        
        if let input = totalAmountFld.text {
            if input.isEmpty {
                validation = false
                //                interestFld.showErr()
            } else {
                if let value = Double(input as String) {
                    totalAmount = value
                    //                    interestFld.success()
                }else{
                    validation = false
                    //                    interestFld.showErr()
                }
            }
        }else{
            validation = false
            //            interestFld.showErr()
        }
        
        if let input = numOfYearsFld.text {
            if input.isEmpty {
                validation = false
                //                noOfYearsFld.showErr()
            } else {
                if let value = Int(input as String) {
                    numOfYears = value
                    //                    noOfYearsFld.success()
                }else{
                    validation = false
                    //                    noOfYearsFld.showErr()
                }
            }
        }else{
            validation = false
            //            noOfYearsFld.showErr()
            
        }
        
        // calculate mortgae if all the fields in the view are not empty and is valid
        if validation {
            print("ddddddd")
            let interest = interestFormulae(loanAmount: loanAmount, totalAmount: totalAmount, numOfYears: numOfYears)
            interestLbl.text = String(interest) + "%"
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
    

}
