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
