//
//  History.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import Foundation

class Ledger {
    let calculation: String
    
    // initiate the calculation
    init(calculation: String) {
        self.calculation = calculation
    }
    
    // get the calculation
    func getCalculation() -> String {
        return calculation
    }
}
