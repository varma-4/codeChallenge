//
//  AddMobileViewController.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/28/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit
import RealmSwift

class AddMobileViewController: UIViewController {
    
    @IBOutlet weak var nameAndMobile: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var battery: UITextField!
    @IBOutlet weak var primaryCamera: UITextField!
    @IBOutlet weak var secondaryCamera: UITextField!
    @IBOutlet weak var memory: UITextField!
    
    @IBOutlet var topConstraintToSuperView: NSLayoutConstraint!
    
    override func loadView() {
        super.loadView()
        addNaviagtionBarButtons()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegateMethods()
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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: toggleMenuKey), object: nil)
    }
    
    func setupTextFieldDelegateMethods() {
        nameAndMobile.delegate = self
        color.delegate = self
        cost.delegate = self
        battery.delegate = self
        primaryCamera.delegate = self
        secondaryCamera.delegate = self
        memory.delegate = self
    }
    
    func customizeTextFields() {
        nameAndMobile.autocorrectionType = .no
        color.autocorrectionType = .no
        
        cost.addRightView(withSymbol: MobileInformation.currencySymbol, mode: .always)
        cost.addDoneButtonOnKeyboard()
        
        battery.addRightView(withSymbol: MobileInformation.batteryUnit, mode: .always)
        battery.addDoneButtonOnKeyboard()
        
        primaryCamera.addRightView(withSymbol: MobileInformation.cameraMeasure, mode: .always)
        primaryCamera.addDoneButtonOnKeyboard()
        
        secondaryCamera.addRightView(withSymbol: MobileInformation.cameraMeasure, mode: .always)
        secondaryCamera.addDoneButtonOnKeyboard()
        
        memory.addRightView(withSymbol: MobileInformation.memoryUnit, mode: .always)
        memory.addDoneButtonOnKeyboard()
    }

    @IBAction func AddMobileInfoAction(_ sender: Any) {
        // CheckforValidations
        let alert = UIAlertController(title: Alert.validationErrorTitle, message: Alert.validationErrorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: Alert.alertActionOK, style: .default) { [weak self](_) in
            guard let `self` = self else { return }
            self.clearAllTextFields()
        }
        alert.addAction(alertAction)
        if validateTextFieldsInput() {
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard let name = nameAndMobile.text, let color = color.text, let cost = cost.text, let battery = battery.text, let primCamera = primaryCamera.text, let secCamera = secondaryCamera.text, let memory = memory.text else { return }
        
        let mobile = Mobile(name: name, color: color, cost: cost, battery: battery, primCamera: primCamera, secCamera: secCamera, memory: memory)
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(mobile)
            }
            
            //Alert User about data insertion & reset textfields
            alert.message = Alert.successMessage
            alert.title = Alert.successTitle
            self.present(alert, animated: true) {
                self.clearAllTextFields()
            }
        } catch {
           print(error.localizedDescription)
        }
        
    }
    
    func validateTextFieldsInput() -> Bool {
        if nameAndMobile.text?.count == 0 ||
            color.text?.count == 0 ||
            cost.text?.count == 0 ||
            battery.text?.count == 0 ||
            primaryCamera.text?.count == 0 ||
            secondaryCamera.text?.count == 0 ||
            memory.text?.count == 0 {
            return true
        }
        return false
    }
    
    func clearAllTextFields() {
        nameAndMobile.clear()
        color.clear()
        cost.clear()
        battery.clear()
        primaryCamera.clear()
        secondaryCamera.clear()
        memory.clear()
    }
    
}

extension AddMobileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Increse constraint
        if textField == battery ||
            textField == primaryCamera ||
            textField == secondaryCamera ||
            textField == memory {
            topConstraintToSuperView.constant = addMobileTopConstraintRemoval
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Decrease Constraint height
        topConstraintToSuperView.constant = addMobileTopConstraintAdditon
    }
    
}
