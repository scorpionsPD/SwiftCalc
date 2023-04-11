//
//  Extentions.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 07/04/23.
//

import Foundation
import UIKit

extension UIApplication {
    static func topViewController() -> UIViewController? {
        if let scenes = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = scenes.windows.first, let base = window.rootViewController {
            return base
        }
        return nil
    }
}
extension UIColor {
    func colorFromHexString (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        let scanner = Scanner(string: cString)
        var hexNumber: UInt64 = 0
        scanner.scanHexInt64(&hexNumber)
        return UIColor(
            red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
