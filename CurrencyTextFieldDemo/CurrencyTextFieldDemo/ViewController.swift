//
//  ViewController.swift
//  CurrencyTextFieldDemo
//
//  Created by Deshmukh,Richa on 6/2/16.
//  Copyright © 2016 Richa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: CurrencyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing is called")
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        textField.text = "$0.00"
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

