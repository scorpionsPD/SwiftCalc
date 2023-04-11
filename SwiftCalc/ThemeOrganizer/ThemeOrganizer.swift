//
//  ThemeOrganizer.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 10/04/23.
//

import UIKit
import Foundation

enum Theme: Int {
    case color, black
    
    fileprivate var switchColor: UIColor {
        switch self {
        case .color:
            return UIColor().colorFromHexString("#ffa500")
        case .black:
            return UIColor().colorFromHexString("#5A5A5A")
        }
    }
    var symbolsBackgroundColor: UIColor {
        switch self {
        case .color:
            return UIColor().colorFromHexString("#ffa500")
        case .black:
            return UIColor().colorFromHexString("#5A5A5A")
        }
    }
    fileprivate var digitsBackgroundColor: UIColor {
        switch self {
        case .color:
            return UIColor().colorFromHexString("#5B7C99")
        case .black:
            return UIColor().colorFromHexString("#ffffff")
        }
    }
    fileprivate var viewBackgroundColor: UIColor {
        switch self {
        case .color:
            return UIColor().colorFromHexString("#5B7C99")
        case .black:
            return UIColor().colorFromHexString("#ffffff")
        }
    }
    fileprivate var textColor: UIColor {
        switch self {
        case .color:
            return UIColor().colorFromHexString("#272727")
        case .black:
            return UIColor().colorFromHexString("#000000")
        }
    }
}
class ThemeOrganizer {
    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: Constants.themeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .color
        }
    }
    static func applyTheme(theme: Theme) {
        UserDefaults.standard.setValue(theme.rawValue, forKey: Constants.themeKey)
        UserDefaults.standard.synchronize()
        UISwitch.appearance().onTintColor = theme.switchColor.withAlphaComponent(0.3)
        UISwitch.appearance().thumbTintColor = theme.switchColor
        UIButton.appearance().backgroundColor = theme.digitsBackgroundColor
        UILabel.appearance().textColor = theme.textColor
    }
}
