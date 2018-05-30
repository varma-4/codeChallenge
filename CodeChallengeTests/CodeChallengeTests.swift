//
//  CodeChallengeTests.swift
//  CodeChallengeTests
//
//  Created by Manikanta Varma on 5/28/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import XCTest
@testable import CodeChallenge
import RealmSwift

class CodeChallengeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testContainerViewLoading() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(main, "Could Not instantiate storboard for TabBar ViewController")
        guard let vc = main.instantiateViewController(withIdentifier: "ContainerVC") as? ContainerViewController else {
            XCTAssert(false, "Could not instantiate Container View Controller")
            return
        }
        
        _ = vc.view
        // Intially Left Menu should be closed
        XCTAssertNotNil(vc.scrollView, "Scroll View is unavailable")
    }
    
    func testTabBarLoading() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(main, "Could Not instantiate storboard for TabBar ViewController")
        let tabBar1 = main.instantiateViewController(withIdentifier: "AddMobileVC") as? AddMobileViewController
        XCTAssertNotNil(tabBar1, "Could not instantiate AddMobile View Controller")
        _ = tabBar1?.view
        
        let tabBar2 = main.instantiateViewController(withIdentifier: "MobilesVC") as? MobilesViewController
        XCTAssertNotNil(tabBar2, "Could not instantiate Mobiles View Controller")
        _ = tabBar2?.view
    }
    
    func testClearTextFields() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(main, "Could Not instantiate storboard for TabBar ViewController")
        let tabBar1 = main.instantiateViewController(withIdentifier: "AddMobileVC") as? AddMobileViewController
        XCTAssertNotNil(tabBar1, "Could not instantiate AddMobile View Controller")
        _ = tabBar1?.view
        
        tabBar1?.cost.text = "Some Text"
        tabBar1?.nameAndMobile.text = "name & Mobile"
        tabBar1?.battery.text = "10"
        tabBar1?.color.text = "Red"
        tabBar1?.primaryCamera.text = "35"
        tabBar1?.secondaryCamera.text = "10"
        tabBar1?.memory.text = "50"
        
        XCTAssertTrue((tabBar1?.doTextFieldsHaveValidData())!, "Validation of TextFields failed")
        tabBar1?.clearAllTextFields()
        XCTAssertFalse((tabBar1?.doTextFieldsHaveValidData())!, "Validation of TextFields failed")
    }
    
    func testRealmFetch() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(main, "Could Not instantiate storboard for TabBar ViewController")
        
        let tabBar2 = main.instantiateViewController(withIdentifier: "MobilesVC") as? MobilesViewController
        XCTAssertNotNil(tabBar2, "Could not instantiate Mobiles View Controller")
        _ = tabBar2?.view
        
        // Intially Results is nil
        XCTAssertEqual(tabBar2?.mobileInfoArray, nil)
        // Setup Mock Data and insert into realm database
        let mobile = Mobile(name: "iPhone X", color: "Red", cost: "30000", battery: "2400", primCamera: "6", secCamera: "3", memory: "34")
        DatabaseHelper.sharedInstance.insert(mobileInfo: mobile)
        
        tabBar2?.fetchMobileInfoFromRealm()
        XCTAssertEqual(tabBar2?.mobileInfoArray?.count, 1)
        
        // Delete Mock data from Realm
        DatabaseHelper.sharedInstance.deleteRecord(mobileInfo: mobile)
        
        tabBar2?.fetchMobileInfoFromRealm()
        XCTAssertEqual(tabBar2?.mobileInfoArray?.count, 0)
    }
    
    func testRealmInsertFromTextFields() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(main, "Could Not instantiate storboard for TabBar ViewController")
        let tabBar1 = main.instantiateViewController(withIdentifier: "AddMobileVC") as? AddMobileViewController
        XCTAssertNotNil(tabBar1, "Could not instantiate AddMobile View Controller")
        _ = tabBar1?.view
        
        // Setup data in textFields
        tabBar1?.cost.text = "2000"
        tabBar1?.nameAndMobile.text = "iPhone X"
        tabBar1?.battery.text = "10"
        tabBar1?.color.text = "Red"
        tabBar1?.primaryCamera.text = "35"
        tabBar1?.secondaryCamera.text = "10"
        tabBar1?.memory.text = "50"
        
        tabBar1?.validateAndInsertData()
        XCTAssertEqual(DatabaseHelper.sharedInstance.fetchRecordsFromRealm()?.count, 1)
        DatabaseHelper.sharedInstance.deleteAllRecords()
        XCTAssertEqual(DatabaseHelper.sharedInstance.fetchRecordsFromRealm()?.count, 0)
    }
    
}
