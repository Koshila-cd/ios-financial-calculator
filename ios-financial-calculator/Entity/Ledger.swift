//
//  Ledger.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import Foundation

class Ledger {
    
//    let type: String
    let calculation: String
    
    init(calculation: String) {
//        self.type = type
        self.calculation = calculation
    }
    
//    func getType() -> String {
//        return type
//    }
    
    func getCalculation() -> String {
        return calculation
    }
}
