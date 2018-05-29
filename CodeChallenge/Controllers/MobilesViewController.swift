//
//  MobilesViewController.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit
import RealmSwift

class MobilesViewController: UIViewController {
    
    @IBOutlet weak var mobilesTableView: UITableView!
    
    fileprivate var indexPathsModified = Dictionary<String, (index: IndexPath, isExpanded: Bool)>()
    var mobileInfoArray: Results<Mobile>? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mobilesTableView.tableFooterView = UIView()
        addNaviagtionBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMobileInfoFromRealm()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchMobileInfoFromRealm() {
        do {
            let realm = try Realm()
            mobileInfoArray = realm.objects(Mobile.self)
            DispatchQueue.main.async {
                self.mobilesTableView.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func addNaviagtionBarButtons() {
        let leftNavBarButtonImage = #imageLiteral(resourceName: "NavMenu").withRenderingMode(.alwaysOriginal)
        let leftNavBarButton = UIBarButtonItem(image: leftNavBarButtonImage, style: .plain, target: self, action: #selector(self.openMenu))
        self.navigationItem.leftBarButtonItems = [leftNavBarButton]
    }
    
    @objc func openMenu() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: toggleMenuKey), object: nil)
    }

}


// MARK: - TableView Delegate & DataSource Methods
extension MobilesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (mobileInfoArray == nil) ? 0 : (mobileInfoArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: mobilesTableViewCellIdentifier, for: indexPath) as? MobilesTableViewCell else { return UITableViewCell() }
        
        if let mobileArray = mobileInfoArray {
            let mobileInfo = mobileArray[indexPath.row]
            cell.configureLabels(mobileInfo: mobileInfo)
        }
        cell.delegate = self
        cell.index = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return MobilesTableViewCell.regularHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPathsModified.count == 0 { return MobilesTableViewCell.regularHeight }

        for indexPathDict in indexPathsModified {
            if indexPath.row != indexPathDict.value.index.row || indexPathDict.value.isExpanded == false {
                continue
            }
            return MobilesTableViewCell.expandedHeight
        }

        return MobilesTableViewCell.regularHeight
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            if let mobileInfoArray = mobileInfoArray {
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(mobileInfoArray[indexPath.row])
                    }
                    self.fetchMobileInfoFromRealm()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

// MARK: - TableViewCell Status Protocol
extension MobilesViewController: TableViewCellStatus {
    
    func selectedIndex(index: Int, withExpand flag: Bool) {
        let indepath = IndexPath(row: index, section: 0)
        indexPathsModified["\(index)"] = (index: indepath, isExpanded: flag)
        self.mobilesTableView.beginUpdates()
        self.mobilesTableView.endUpdates()
    }
    
}

