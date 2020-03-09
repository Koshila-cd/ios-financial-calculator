//
//  CalculateInterestViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class CalculateInterestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
    }

    @IBOutlet weak var amountFld: UITextField!
    @IBOutlet weak var futureValueFld: UITextField!
    @IBOutlet weak var paymentsFld: UITextField!
    @IBOutlet weak var interestValueLbl: UILabel!
    
    @IBAction func calculateBtn(_ sender: UIButton) {
//        var amount: Double = 0
//        var futureValue: Double = 0
//        var interest: Double = 0
        print(amountFld.text ?? 34.00)
//        if let input = amountFld.text, !input.isEmpty {
//            print(input)
//        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
