//
//  Costomization.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import Foundation
import UIKit

class Customization {
    static let shared = Customization()
    var actions: Dictionary<String, Bool> = [
        "＋" : true,
        "﹣" : true,
        "×" : true,
        "/" : true,
        "sin" : true,
        "cos" : true,
        "₿" : true
    ]
    func checkForState(_ symbol: String) -> Bool{
        return self.actions[symbol]!
    }
    func updateState(symbol: String, value: Bool,didUpdate:(() -> ())) {
        actions.updateValue(value, forKey: symbol)
        didUpdate()
    }
    init(){}
}
