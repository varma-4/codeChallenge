//
//  Mobile.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import Foundation
import RealmSwift

class Mobile: Object {
    
    // MARK: - Persisted Properties
    @objc dynamic var name = ""
    @objc dynamic var color = ""
    @objc dynamic var cost = ""
    @objc dynamic var battery = ""
    @objc dynamic var primaryCamera = ""
    @objc dynamic var secondaryCamera = ""
    @objc dynamic var memory = ""
    
    // MARK: - Init
    convenience init(name: String, color: String, cost: String, battery: String, primCamera: String, secCamera: String, memory: String) {
        self.init()
        self.name = name
        self.color = color
        self.cost = cost
        self.battery = battery
        self.primaryCamera = primCamera
        self.secondaryCamera = secCamera
        self.memory = memory
    }

}
