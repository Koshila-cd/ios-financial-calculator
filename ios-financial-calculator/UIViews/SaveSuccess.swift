//
//  SaveSuccess.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/15/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import Foundation
import UIKit

class SaveSuccess: UIView {
    
    static let instance = SaveSuccess()
    
    // mapping UI with code
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var label: UILabel!
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("SaveSuccess", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
        - The common styles added to an alert with any label
    */
    private func commonInit() {
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    /**
        - The parent view alert in added into the window
        - parameters:
        - text: The label of the alert
    */
    func showAlert(text: String) {
        label.text = text
        parentView.isHidden = false
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    /**
        - The alert is hidden when the 'OK' in the alert is clicked
        - parameters:
        - sender: The button item
    */
    @IBAction func okBtn(_ sender: Any) {
        parentView.isHidden = true
    }
    
}
