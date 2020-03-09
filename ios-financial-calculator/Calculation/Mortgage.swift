//
//  Mortgage.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class Mortgage {
    
    public struct Mortgage
    {
        var loanAmount:Double = 0.0
        var interestRate: Double = 0.0
        var numOfYears: Int = 0
    }

    
    class func calculateMortgage(m:Mortgage)-> Double
    {
        
        print("fffffffff")
        //formula here
        var mortgage: Double = 0.0
        
        let n = Double(12 * m.numOfYears)
        let t = Double(m.numOfYears)
        let formulae1: Double = ((m.loanAmount*n)+m.interestRate)
        
        let formulae2: Double = pow((1+(m.interestRate*n)),n*t)
        
        mortgage = (formulae1 * formulae2)/(formulae2 - 1)
        print("mooooooortage")
        print(mortgage)
        
        return mortgage
        
    }
}
