//
//  textInput.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/13/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import Foundation
import UIKit

class textInputDelegate: NSObject, UITextFieldDelegate {
    
    var vc: MemeEditorViewController?
    
    // Clear the text field if it has the default value
    func textFieldDidBeginEditing(textField: UITextField) {
        if ( textField.text == "TOP" || textField.text == "BOTTOM") {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
