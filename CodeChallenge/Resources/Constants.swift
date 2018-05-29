//
//  Constants.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

var mobilesTableViewCellIdentifier = "MobilesCell"
var tooggleMenuTableViewCellIdentifier = "ToggleMenuCell"

var toggleMenuOptions = ["Profile", "Settings", "Orders"]
var toggleMenuKey = "toggleMenu"
var toggleMenuWidth: CGFloat = 260

struct MobileInformation {
    var currencySymbol = "₹"
    var batteryUnit = "mAh"
    var cameraMeasure = "MP"
    var memoryUnit = "GB"
}
