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
    var calculationType = MORTGAGE_PAYMENT
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createLedger(type: calculationType)
        tableView.delegate = self
        tableView.dataSource = self
//        DispatchQueue.main.async { self.tableView.reloadData() }
        
        print("cccc")
        
    }
   
    
    
    func createLedger(type: String) {
        ledger = []

        let ledgerList = UserDefaults.standard.value(forKey: calculationType) as? [String]
        
        if ledgerList?.count ?? 0 > 0 {
            for calculation in ledgerList! {
                let ledger1 = Ledger(calculation: calculation)
                ledger += [ledger1]
                print(ledger1.getCalculation())
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ledger", for: indexPath) as! LedgerTableViewCell
        print("Table Viewwwwww")
        print(cell.ledgerText.text)
//        cell.ledgerText.text = ledger[indexPath.row].getCalculation()
        print(ledger[indexPath.row].getCalculation())
        cell.ledgerText.text = "ledgerrrr texttttttt"
        print(cell.ledgerText.text)
        
        // Card(cell) styles
        cell.isUserInteractionEnabled = false
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
    

}
