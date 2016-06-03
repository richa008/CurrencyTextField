//
//  CurrencyTextField.swift
//  CurrencyTextFieldDemo
//
//  Created by Deshmukh,Richa on 6/2/16.
//  Copyright © 2016 Richa. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class CurrencyTextField : UITextField{
    
    let maxDigits = 12
    
    let currencyTextFieldDelegate = CurrencyTextFieldDelegate()
    
    let currencyFormattor = NSNumberFormatter()
    
    // MARK: - init functions
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initTextField()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initTextField()
    }
    
    func initTextField(){
        self.keyboardType = UIKeyboardType.DecimalPad
        self.text = "$0.00"
        self.delegate = currencyTextFieldDelegate
        currencyFormattor.numberStyle = .CurrencyStyle
        currencyFormattor.minimumFractionDigits = 2
        currencyFormattor.maximumFractionDigits = 2
    }
    
    //MARK: - Custom text field functions
    
    func setAmount (amount : Double){
        let textFieldStringValue = currencyFormattor.stringFromNumber(amount)
        self.text = textFieldStringValue
    }
    
}