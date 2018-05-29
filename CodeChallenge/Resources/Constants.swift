//
//  Constants.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

var mobilesTableViewCellIdentifier = "MobilesCell"
var mobilesCellExpandTitle = "More Info"
var mobileCellCompressTitle = "Less Info"
var tooggleMenuTableViewCellIdentifier = "ToggleMenuCell"

var toggleMenuOptions = ["Profile", "Settings", "Orders"]
var toggleMenuKey = "toggleMenu"
var toggleMenuWidth: CGFloat = 260

var addMobileTopConstraintRemoval: CGFloat = -60
var addMobileTopConstraintAdditon: CGFloat = 30

var separatorSpace = " "

public struct Alert {
    static var successTitle = "Success"
    static var successMessage = "Data is successfully added"
    static var validationErrorTitle = "Validation Error"
    static var validationErrorMessage = "Please Enter Valid details"
    static var alertActionOK = "OK"
    
}

public struct MobileInformation {
    static var currencySymbol = "₹"
    static var batteryUnit = "mAh"
    static var cameraMeasure = "MP"
    static var memoryUnit = "GB"
}
