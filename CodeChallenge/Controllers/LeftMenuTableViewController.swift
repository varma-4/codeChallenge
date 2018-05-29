//
//  LeftMenu.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

class LeftMenuTableViewController : UITableViewController {
    
    var menuOptions = ["Profile", "Settings", "Orders"]
    
}

// MARK: - UITableViewDataSource methods

extension LeftMenuTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.text = menuOptions[indexPath.row]
        return cell
    }
    
}
