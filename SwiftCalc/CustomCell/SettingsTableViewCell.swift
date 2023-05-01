//
//  SettingsTableViewCell.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import UIKit
class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var symbolText: UILabel!
    var toggledHandler: ((String,Bool) -> ())?
    var cellData:Settings? {
        didSet {
            guard let data = cellData else { return }
            symbolText.text = data.symbol
            toggleSwitch.isOn = data.isActive
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /*
     operators enable/disable switch
     */
    @IBAction func turnOnOffSwitch(_ sender: UISwitch) {
        if let toggled = toggledHandler {
            toggled(self.symbolText.text!,self.toggleSwitch.isOn)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
