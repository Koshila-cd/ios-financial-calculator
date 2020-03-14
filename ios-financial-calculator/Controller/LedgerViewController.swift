//
//  LedgerViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/14/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class LedgerViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    var ledger = [Ledger]()
//    var calculationType = MORTGAGE_AMOUNT
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLedger()
        tableView.delegate = self
        tableView.dataSource = self
        DispatchQueue.main.async { self.tableView.reloadData() }
        
//        tableView.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        print("cccc")
        
    }
   
    
    
    func createLedger() {
        ledger = []

        var ledgerList = UserDefaults.standard.value(forKey: MORTGAGE_PAYMENT) as? [String]
        
        if ledgerList?.count ?? 0 > 0 {
            for calculation in ledgerList! {
                let ledger1 = Ledger(calculation: calculation)
                ledger += [ledger1]
            }
            
        }
        
        ledgerList = UserDefaults.standard.value(forKey: MORTGAGE_AMOUNT) as? [String]
        if ledgerList?.count ?? 0 > 0 {
            for calculation in ledgerList! {
                let ledger1 = Ledger(calculation: calculation)
                ledger += [ledger1]
            }
            
        }
        
        ledgerList = UserDefaults.standard.value(forKey: MORTGAGE_INTEREST) as? [String]
        if ledgerList?.count ?? 0 > 0 {
            for calculation in ledgerList! {
                let ledger1 = Ledger(calculation: calculation)
                ledger += [ledger1]
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ledger") as! LedgerTableViewCell

        
        cell.ledgerText.text = ledger[indexPath.row].getCalculation()
        cell.ledgerType.text = "Mortgage"

        
        // Card(cell) styles
        cell.isUserInteractionEnabled = false
        cell.contentView.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
//        cell.contentView.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00)
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ledger.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    

}
