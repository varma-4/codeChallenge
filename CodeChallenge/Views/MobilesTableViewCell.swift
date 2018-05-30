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

    @IBOutlet weak var memoryLabel: UILabel!
    @IBOutlet weak var secondaryCameraLabel: UILabel!
    @IBOutlet weak var primaryCameraLabel: UILabel!
    @IBOutlet weak var mobileBatteryLabel: UILabel!
    @IBOutlet weak var mobileCostLabel: UILabel!
    @IBOutlet weak var mobileColorLabel: UILabel!
    @IBOutlet weak var mobileNameLabel: UILabel!
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mobileNameLabel.clear()
        mobileColorLabel.clear()
        mobileCostLabel.clear()
        mobileBatteryLabel.clear()
        primaryCameraLabel.clear()
        secondaryCameraLabel.clear()
        memoryLabel.clear()
    }
    
    func configureLabels(mobileInfo: Mobile) {
        mobileNameLabel.text = mobileInfo.name
        mobileColorLabel.text = mobileInfo.color
        mobileCostLabel.text = MobileInformation.currencySymbol + separatorSpace + mobileInfo.cost
        mobileBatteryLabel.text = mobileInfo.battery + separatorSpace + MobileInformation.batteryUnit
        primaryCameraLabel.text = mobileInfo.primaryCamera + separatorSpace + MobileInformation.cameraMeasure
        secondaryCameraLabel.text = mobileInfo.secondaryCamera + separatorSpace + MobileInformation.cameraMeasure
        memoryLabel.text = mobileInfo.memory + separatorSpace + MobileInformation.memoryUnit
        configureCell()
    }
    
    func configureCell() {
        let title = isExpanded ? mobileCellCompressTitle : mobilesCellExpandTitle
        moreButton.setTitle(title, for: .normal)
    }
    
    @IBAction func moreButtonAction(_ sender: Any) {
        isExpanded = !isExpanded
        configureCell()
        guard let `delegate` = delegate else { return }
        delegate.selectedIndex(index: index, withExpand: isExpanded)
    }
    
}
