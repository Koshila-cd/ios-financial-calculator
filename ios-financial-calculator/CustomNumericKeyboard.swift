//
//  CustomNumericKeyboard.swift
//  ios-financial-calculator
//
//  Created by IIT on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

// public constant which sets the recommended keyboard height
let customNKbRecommendedHeight = 274.00

// private constants to set button colours
private let defaultKeyColour = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00)
private let pressedKeyColour = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.00)

@objc protocol CustomNumericKeyboardDelegate {
    func numericKeyPressed(key: Int)
    func numericBackspacePressed()
    func numericSymbolPressed(symbol: String)
    func retractKeyPressed()
}

class CustomNumericKeyboard: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    // All button outlets except the backspace button
    // This is used in changing the button appearance.
    var allButtons: [UIButton] { return [btnKey0, btnKey1, btnKey2, btnKey3, btnKey4, btnKey5, btnKey6, btnKey7, btnKey8, btnKey9, btnKeyPeriod, btnKeyMinus] }
    
    
    // This variable will be set as the view controller so that
    // the keyboard can send messages to the view controller.
    weak var delegate: CustomNumericKeyboardDelegate?
    
    // appearance variables
    var btnDefaultBgColour = defaultKeyColour { didSet { updateButtonAppearance() } }
    var btnPressedBgColour = pressedKeyColour { didSet { updateButtonAppearance() } }
    var btnDefaultFontColor = UIColor.gray { didSet { updateButtonAppearance() } }
    var btnPressedFontColor = UIColor.white { didSet { updateButtonAppearance() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(enableMinusButton(notification:)),
                                               name: NSNotification.Name(rawValue: "enableMinusButton"), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeKeyboard()
    }
    
    func initializeKeyboard() {
        let xibFileName = "CustomNumericKeyboard"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        
        updateButtonAppearance()
        
        // disables minus button by default
//        btnKeyMinus.isUserInteractionEnabled = false
    }
    
    // This function changes button appearance in different states.
    fileprivate func updateButtonAppearance() {
        for button in allButtons {
            button.setTitleColor(btnDefaultFontColor, for: .normal)
            button.setTitleColor(btnPressedFontColor, for: [.selected, .highlighted])
            if button.isSelected {
                button.backgroundColor = btnPressedBgColour
            } else {
                button.backgroundColor = btnDefaultBgColour
            }
        }
    }
    
    // This function can be used to programatically enable the minus button.
    @objc func enableMinusButton(notification: NSNotification) {
//        btnKeyMinus.isUserInteractionEnabled = true
    }

}
