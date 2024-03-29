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
    
    // mapping UI with code
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteBarButton: UIBarButtonItem!
    
    // the user default keys
    let keys = ["MORTGAGE_PAYMENT", "MORTGAGE_AMOUNT", "MORTGAGE_INTEREST", "LOAN_INTEREST", "LOAN_PAYMENT", "LOAN_PRESENT_VALUE", "LOAN_FUTURE_VALUE", "COMPOUND_INTEREST", "COMPOUND_PRESENT_VALUE", "COMPOUND_PRESENT_VALUE", "SAVINGS_FUTURE_VALUE", "SAVINGS_INTEREST", "SAVINGS_DEPOSIT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        DispatchQueue.main.async { self.tableView.reloadData() }
        
        deleteBarButton.isEnabled = true
        
    }
     // initialized and reloads the ledger when coming to ledger view
    override func viewDidAppear(_ animated: Bool) {
        createLedger()
    }
     
    /**
        - Initialize cell stlyes
        - parameters:
        - tableView: The UI table view
        - cell: The UI table view cell
        - indexPath: The index of the cell
     */
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.borderWidth = 3.0
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.backgroundColor = UIColor.purple
    }
    
    /**
     - Looping through user default keys and adding the values into the arrray ledger 
     */
    func createLedger() {
        ledger = []
        for key in keys {
            print(key)
            let ledgerList = UserDefaults.standard.value(forKey: key) as? [String]
            if ledgerList?.count ?? 0 > 0 {
                for calculation in ledgerList! {
                    let ledger1 = Ledger(calculation: calculation)
                    ledger += [ledger1]
                }
            }
        }
        tableView.reloadData()
    }
    
    /**
        - Add values into ledger cells
        - parameters:
        - tableView: The UI table view
        - indexPath: The index of the cell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ledger") as! LedgerTableViewCell
        
        let value : String = ledger[indexPath.row].getCalculation()
        let parts =   value.split(separator: "#")
        
        if parts.count > 0 {
            cell.ledgerText.text = String(parts[1])
            cell.ledgerType.text = String(parts[0])
        }
        
        // cell styles
        cell.isUserInteractionEnabled = false
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    /**
        - add table empty message is there are no values in ledger array
        - parameters:
        - tableView: The UI table view
        - section: The integer section
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ledger.count == 0 {
            self.tableView.setEmptyMessage("No saved calculations found", UIColor.black)
        } else {
            self.tableView.restore()
        }
        return ledger.count
    }
    
    /**
        - The row height of cell
        - parameters:
        - tableView: The UI table view
        - indexPath: The index of the cell
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    /**
        - Ledgr delete function
        - parameters:
        - sender: The UI bar button item
     */
    @IBAction func deleteLedger(_ sender: UIBarButtonItem) {
        if ledger.count > 0 {
            
            for key in keys {
                UserDefaults.standard.set([], forKey: key)
            }
            
            SaveSuccess.instance.showAlert(text: "The ledger is Successfully Deleted!")
            deleteBarButton.isEnabled = false
            
            // refetch and reload table
            createLedger()
            DispatchQueue.main.async{ self.tableView.reloadData() }
            
        }
        
    }
}
