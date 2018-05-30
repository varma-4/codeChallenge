//
//  DatabaseHelper.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/30/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit
import RealmSwift

class DatabaseHelper {
    
    static var sharedInstance = DatabaseHelper()
    
    var realmInstance: Realm? = {
        do {
            return try Realm()
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }()
    
    func fetchRecordsFromRealm() -> Results<Mobile>? {
        guard let realm = realmInstance else { return nil }
        return realm.objects(Mobile.self)
    }
    
    func insert(mobileInfo mobile: Mobile) {
        guard let realm = realmInstance else { return }
        do {
            try realm.write {
                realm.add(mobile)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteRecord(mobileInfo mobile: Mobile) {
        guard let realm = realmInstance else { return }
        do {
            try realm.write {
                realm.delete(mobile)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAllRecords() {
        guard let records = fetchRecordsFromRealm() else { return }
        for eachMobileInfo in records {
            deleteRecord(mobileInfo: eachMobileInfo)
        }
    }
    
}
