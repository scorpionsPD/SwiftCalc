//
//  SettingsViewModal.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import Foundation

struct SettingsViewModal {
    var symbolsArray: [Settings] {
        get {
            Customization.shared.actions.map{ Settings(symbol: $0.key, active: $0.value)}
        }
    }
    var delegate: SettingsDelegate?
    
    /*
     updates symbol's centerlized dict
     Params:
     symbol: operator
     value: enable/disable
     */
    func updateSymbols(symbol:String, value: Bool) {
        Customization.shared.updateState(symbol: symbol, value: value, didUpdate: {
            if let delegate = self.delegate {
                delegate.didUpdate()
            }
        })
    }
    /*
     return number of rows for seetings table view controller
     */
    func numberOfRows() -> Int {
        return 7
    }
}
