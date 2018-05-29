//
//  MobilesViewController.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

class MobilesViewController: UIViewController {
    
    @IBOutlet weak var mobilesTableView: UITableView!
    fileprivate var indexPathPrev = Dictionary<String, (index: IndexPath, isExpanded:  Bool)>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mobilesTableView.tableFooterView = UIView()
        addNaviagtionBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.mobilesTableView.reloadData()
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

}

extension MobilesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mobilesTableViewCellIdentifier, for: indexPath) as! MobilesTableViewCell
        
        cell.delegate = self
        cell.index = indexPath.row
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return MobilesTableViewCell.regularHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPathPrev.count == 0 { return MobilesTableViewCell.regularHeight }

        for indexPathDict in indexPathPrev {
            if indexPath.row != indexPathDict.value.index.row || indexPathDict.value.isExpanded == false {
                continue
            }
            return MobilesTableViewCell.expandedHeight
        }

        return MobilesTableViewCell.regularHeight
    }
    
}

extension MobilesViewController: TableViewCellStatus {
    
    func selectedIndex(index: Int, withExpand flag: Bool) {
        let indepath = IndexPath(row: index, section: 0)
        indexPathPrev["\(index)"] = (index: indepath, isExpanded: flag)
        self.mobilesTableView.beginUpdates()
        self.mobilesTableView.endUpdates()
    }
    
}

