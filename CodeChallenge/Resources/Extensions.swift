//
//  Extensions.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/28/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

extension UITextField {
    
    func addRightView(withSymbol symbol: String, mode: UITextFieldViewMode) {
        self.rightViewMode = mode
        
        let textFieldRightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = symbol
        label.textColor = UIColor.black
        
        textFieldRightView.addSubview(label)
        self.rightView = textFieldRightView
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
}
