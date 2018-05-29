//
//  AddMobileViewController.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/28/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

class AddMobileViewController: UIViewController {
    
    @IBOutlet weak var nameAndMobile: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var battery: UITextField!
    @IBOutlet weak var primaryCamera: UITextField!
    @IBOutlet weak var secondaryCamera: UITextField!
    @IBOutlet weak var memory: UITextField!
    
    @IBOutlet weak var topConstraintToSuperView: NSLayoutConstraint!
    
    override func loadView() {
        super.loadView()
        addNaviagtionBarButtons()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTextFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addNaviagtionBarButtons() {
        let leftNavBarButtonImage = #imageLiteral(resourceName: "NavMenu").withRenderingMode(.alwaysOriginal)
        let leftNavBarButton = UIBarButtonItem(image: leftNavBarButtonImage, style: .plain, target: self, action: #selector(self.openMenu))
        self.navigationItem.leftBarButtonItems = [leftNavBarButton]
    }
    
    @objc func openMenu() {
        print("Opening Menu")
    }
    
    func customizeTextFields() {
        cost.addRightView(withSymbol: "₹", mode: .always)
        cost.addDoneButtonOnKeyboard()
        
        battery.addRightView(withSymbol: "mAh", mode: .always)
        battery.addDoneButtonOnKeyboard()
        
        primaryCamera.addRightView(withSymbol: "MP", mode: .always)
        primaryCamera.addDoneButtonOnKeyboard()
        
        secondaryCamera.addRightView(withSymbol: "MP", mode: .always)
        secondaryCamera.addDoneButtonOnKeyboard()
        
        memory.addRightView(withSymbol: "GB", mode: .always)
        memory.addDoneButtonOnKeyboard()
    }

}

extension AddMobileViewController {
    
    
    
}
