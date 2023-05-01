//
//  SettingsViewController.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import UIKit

protocol SettingsDelegate {
    func didUpdate()
}

class SettingsViewController: UIViewController {
    var delegate: SettingsDelegate?
    var vm = SettingsViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsTableViewCell.self), for: indexPath) as! SettingsTableViewCell
        let cellData = vm.symbolsArray[indexPath.row]
        cell.cellData = cellData
        cell.toggledHandler =  { [weak self] (symbol,isActive) in
                guard let self = self else { return }
            self.vm.updateSymbols(symbol: symbol, value: isActive)   /*
                                                                     Called to update any operator
                                                                     Parameters:
                                                                     symbol: operator
                                                                     isActive: enable/disable
                                                                     */
            self.dismiss(animated: true, completion: nil)
        }
        return cell
    }
}
