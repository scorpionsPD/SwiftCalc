//
//  SettingsViewModal.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import Foundation

struct SettingsViewModal {
    private var customize = Customization()
    var symbolsArray: [Settings] {
        get {
           return customize.actions
        }
    }
    var delegate: SettingsDelegate?
    
    /*
     updates symbol's centerlized dict
     Params:
     symbol: operator
     value: enable/disable
     */
    mutating func updateSymbols(symbol:String, value: Bool) {
        customize.updateState(symbol: symbol, value: value, didUpdate: {
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
