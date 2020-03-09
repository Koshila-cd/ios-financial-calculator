//
//  MortgageViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class MortgageViewController: UIViewController {
    
    
    @IBOutlet weak var loanAmountFld: UITextField!
    @IBOutlet weak var interestFld: UITextField!
    @IBOutlet weak var noOfYearsFld: UITextField!
    @IBOutlet weak var paymentLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        paymentLbl.text = "-"
        
    }
    
    @IBAction func calculateMortgage(_ sender: UIButton) {
        
        var loanAmount: Double = 0
        var interestRate: Double = 0
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
        
        if let input = interestFld.text {
            if input.isEmpty {
                validation = false
//                interestFld.showErr()
            } else {
                if let value = Double(input as String) {
                    interestRate = value
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
        
        if let input = noOfYearsFld.text {
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
        
        if validation {
            let mortgage = calculateMortgage(loanAmount: loanAmount, interestRate: interestRate, numOfYears: numOfYears)
            paymentLbl.text = String(format:"%.2f",mortgage)
        } else {
            paymentLbl.text = "-"
        }
        
        
    }
    
    func calculateMortgage(loanAmount: Double, interestRate: Double, numOfYears: Int)-> Double
    {
        
        //formula here
        var mortgage: Double = 0.0
        
        let n = Double(12 * numOfYears)
        let t = Double(numOfYears)
//        let formulae1: Double = ((loanAmount*n)+interestRate)/n
        let formulae1: Double = loanAmount*(interestRate/n)
        
        let formulae2: Double = pow((1+(interestRate/n)),n*t)
        
        mortgage = (formulae1 * formulae2)/(formulae2 - 1)
        print(mortgage)
        
        return mortgage
        
    }
    
    
}
