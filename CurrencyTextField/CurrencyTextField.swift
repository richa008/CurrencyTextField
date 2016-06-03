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
    
    private let maxDigits = 12
    
    private let currencyFormattor = NSNumberFormatter()
    
    private var previousValue : String = "$0.00"
    
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
        currencyFormattor.numberStyle = .CurrencyStyle
        currencyFormattor.minimumFractionDigits = 2
        currencyFormattor.maximumFractionDigits = 2
    }
    
    // MARK: - UITextField Notifications
    
    override public func willMoveToSuperview(newSuperview: UIView!) {
        if newSuperview != nil {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange:", name:UITextFieldTextDidChangeNotification, object: self)
        } else {
            NSNotificationCenter.defaultCenter().removeObserver(self)
        }
    }
    
    func textDidChange(notification: NSNotification){
        
        //Get the original position of the cursor
        let cursorOffset = getOriginalCursorPosition();
        
        let cleanNumericString : String = getCleanNumberString()
       
        if cleanNumericString.characters.count > maxDigits{
            self.text = previousValue
        }
        else{
            let textFieldNumber = Double(cleanNumericString)
            if let textFieldNumber = textFieldNumber{
                let textFieldNewValue = textFieldNumber/100
                setAmount(textFieldNewValue)
            }else{
                self.text = previousValue
            }
        }
        //Set the cursor back to its original poistion
        setCursorOriginalPosition(cursorOffset)
    }
    
    //MARK: - Custom text field functions
    
    func setAmount (amount : Double){
        let textFieldStringValue = currencyFormattor.stringFromNumber(amount)
        self.text = textFieldStringValue
        if let textFieldStringValue = textFieldStringValue{
            previousValue = textFieldStringValue
        }
    }
    
    //MARK - helper functions
    
    private func getCleanNumberString() -> String {
        var cleanNumericString: String = ""
        let textFieldString = self.text
        if let textFieldString = textFieldString{
            
            //Remove $ sign
            var toArray = textFieldString.componentsSeparatedByString("$")
            cleanNumericString = toArray.joinWithSeparator("")
            
            //Remove periods, commas
            toArray = cleanNumericString.componentsSeparatedByCharactersInSet(NSCharacterSet .punctuationCharacterSet())
            cleanNumericString = toArray.joinWithSeparator("")
        }
        
        return cleanNumericString
    }
    
    private func getOriginalCursorPosition() -> Int{
        
        var cursorOffset : Int = 0
        let startPosition : UITextPosition = self.beginningOfDocument
        if let selectedTextRange = self.selectedTextRange{
            cursorOffset = self.offsetFromPosition(startPosition, toPosition: selectedTextRange.start)
        }
        return cursorOffset
    }
    
    private func setCursorOriginalPosition(cursorOffset: Int){
        
        let textFieldLength = self.text?.characters.count
        let newLength = self.text?.characters.count
        let startPosition : UITextPosition = self.beginningOfDocument
        if let textFieldLength = textFieldLength, newLength = newLength where textFieldLength > cursorOffset{
            let newOffset = newLength - textFieldLength - cursorOffset
            let newCursorPosition = self.positionFromPosition(startPosition, offset: newOffset)
            if let newCursorPosition = newCursorPosition{
                let newSelectedRange = self.textRangeFromPosition(newCursorPosition, toPosition: newCursorPosition)
                self.selectedTextRange = newSelectedRange
            }
            
        }
    }
    
}