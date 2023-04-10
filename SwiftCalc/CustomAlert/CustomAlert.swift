//
//  CustomAlert.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 07/04/23.
//

import Foundation
import UIKit
class CustomAlert {
    private func showNerworkErrorAlert() {
        let alertVC = PMAlertController(title: "You are offline", description: "Please connect to internet", image: UIImage(named: "sad_cloud.png"), style: .alert) //Image by icons8.com
        alertVC.addAction(PMAlertAction(title: "oh! sorry", style: .cancel, action: { () -> Void in
        }))
        UIApplication.topViewController()?.present(alertVC, animated: true, completion: nil)
    }
    private func showParseUrlErrorAlert() {
        let alertVC = PMAlertController(title: "Bad URL", description: "Please check", image: UIImage(named: "sad_cloud.png"), style: .alert) //Image by icons8.com
        alertVC.addAction(PMAlertAction(title: "oh! sorry", style: .cancel, action: { () -> Void in
        }))
        UIApplication.topViewController()?.present(alertVC, animated: true, completion: nil)
    }
    func showErrorAlert(error: NetworkError) {
        switch error {
        case .parseUrl:
            showParseUrlErrorAlert()
            break
        case .parseJson:
            break
        case .parseData:
            break
        case .emptyResource:
            break
        case .reachability:
            showNerworkErrorAlert()
            break
        }
    }
}
