//
//  LeftMenu.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

class LeftMenuTableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.isScrollEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - UITableViewDataSource methods

extension LeftMenuTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toggleMenuOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tooggleMenuTableViewCellIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = toggleMenuOptions[indexPath.row]
        return cell
    }
    
}
