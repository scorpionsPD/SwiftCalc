//
//  Costomization.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import Foundation
import UIKit

struct Customization {
    
    private var defaultsSetting: [Settings] = [
        Settings(symbol: "＋", active: true),
        Settings(symbol: "﹣", active: true),
        Settings(symbol: "×", active: true),
        Settings(symbol: "/", active: true),
        Settings(symbol: "sin", active: true),
        Settings(symbol: "cos", active: true),
        Settings(symbol: "₿", active: true)
    ]
    var actions: [Settings] {
        get {
            return Utils.load() ?? self.defaultsSetting // Gives either previouslly stored settings or default settings if nothing stored
        } set {
            Utils.save(newValue) // save new settings to local storage
        }
    }
    /*
    - returns a state of a symbol whether its enable or disable
    - returns true by default
     */
    func checkForState(_ symbol: String) -> Bool{
        if let oper = actions.first(where: {$0.symbol == symbol}) {
            return oper.isActive
        }
        return true
    }
    /*
     update state of symbol enable or disable
     */
    mutating func updateState(symbol: String, value: Bool,didUpdate:(() -> ())) {
        if let row = actions.firstIndex(where: {$0.symbol == symbol}) {
            actions[row] = Settings(symbol: symbol, active: value)
            didUpdate()
        }
    }
}
