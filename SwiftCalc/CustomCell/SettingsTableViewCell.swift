//
//  SettingsTableViewCell.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import UIKit
protocol UpdateStateDelegate {
    func didUpdateState(forSymbol symbol:String, isActive: Bool)
}
class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var symbolText: UILabel!
    var delegate:UpdateStateDelegate?
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
        self.delegate?.didUpdateState(forSymbol: symbolText.text!, isActive: sender.isOn)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
