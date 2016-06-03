//
//  CurrencyTextFieldDelegate.swift
//  CurrencyTextFieldDemo
//
//  Created by Deshmukh,Richa on 6/3/16.
//  Copyright © 2016 Richa. All rights reserved.
//

import Foundation
import UIKit

class CurrencyTextFieldDelegate : NSObject, UITextFieldDelegate{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let maxNumberLength = 12
        
        let textFieldString = textField.text
        let textFieldLength = textFieldString?.characters.count
        
        //Get cursor position
        var cursorOffset : Int = 0
        let startPosition : UITextPosition = textField.beginningOfDocument
        if let selectedTextRange = textField.selectedTextRange{
            cursorOffset = textField.offsetFromPosition(startPosition, toPosition: selectedTextRange.start)
        }
        
        
        var cleanNumericString: String = ""
        
        if let textFieldString = textFieldString{
            cleanNumericString = (textFieldString as NSString).stringByReplacingCharactersInRange(range, withString: string)
            
            //Remove $ sign
            var toArray = cleanNumericString.componentsSeparatedByString("$")
            cleanNumericString = toArray.joinWithSeparator("")
            
            //Remove periods, commas
            toArray = cleanNumericString.componentsSeparatedByCharactersInSet(NSCharacterSet .punctuationCharacterSet())
            cleanNumericString = toArray.joinWithSeparator("")
        }
        
        
        if cleanNumericString.characters.count > maxNumberLength{
            return false
        }
        
        let textFieldNumber = Double(cleanNumericString)
        if let textFieldNumber = textFieldNumber, textField = textField as? CurrencyTextField{
            let textFieldNewValue = textFieldNumber/100
            textField.setAmount(textFieldNewValue)
        }
        
        //Set cursor back to original position
        let newLength = textField.text?.characters.count
        if let textFieldLength = textFieldLength, newLength = newLength where textFieldLength > cursorOffset{
            let newOffset = newLength - textFieldLength - cursorOffset
            let newCursorPosition = textField.positionFromPosition(startPosition, offset: newOffset)
            if let newCursorPosition = newCursorPosition{
                let newSelectedRange = textField.textRangeFromPosition(newCursorPosition, toPosition: newCursorPosition)
                textField.selectedTextRange = newSelectedRange
            }
            
        }
        return false
    }
    
}
