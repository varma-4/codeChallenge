//
//  MobilesTableViewCell.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

protocol TableViewCellStatus {
    func selectedIndex(index: Int, withExpand flag: Bool)
}

class MobilesTableViewCell: UITableViewCell {

    @IBOutlet weak var moreButton: UIButton!
    var index: Int = 0
    var isExpanded = false
    static var expandedHeight: CGFloat = 256
    static var regularHeight: CGFloat = 125
    
    var delegate: TableViewCellStatus?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        let title = isExpanded ? "Less Info" : "More Info"
        moreButton.setTitle(title, for: .normal)
    }
    
    @IBAction func moreButtonAction(_ sender: Any) {
        isExpanded = !isExpanded
        configureCell()
        guard let `delegate` = delegate else { return }
        delegate.selectedIndex(index: index, withExpand: isExpanded)
    }
    
}
