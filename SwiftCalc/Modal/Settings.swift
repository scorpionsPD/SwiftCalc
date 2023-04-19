//
//  Settings.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import Foundation

class Settings: Codable {
    var symbol: String /// operator
    var isActive: Bool /// enable/disable status
    init(symbol: String, active: Bool) {
        self.symbol = symbol
        self.isActive = active
    }
}
