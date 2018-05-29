//
//  ExtensionTests.swift
//  CodeChallengeTests
//
//  Created by Manikanta Varma on 5/30/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//


import XCTest
@testable import CodeChallenge

class ExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLabelExtensions() {
        let label = UILabel()
        label.text = "Hello"
        label.clear()
        XCTAssertEqual(label.text!, "")
    }
    
    func testTextFieldExtensions() {
        let textfield = UITextField()
        textfield.text = "Hello"
        textfield.placeholder = "Placeholder"
        textfield.addDoneButtonOnKeyboard()
        XCTAssert((textfield.inputAccessoryView != nil))
        textfield.clear()
        XCTAssertEqual(textfield.text!, "")
        textfield.addRightView(withSymbol: MobileInformation.currencySymbol, mode: .always)
        XCTAssert((textfield.rightView != nil))
    }
    
}
