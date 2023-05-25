//
//  CustomAlert.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 07/04/23.
//

import Foundation
import UIKit
import Networking

class CustomAlert {
    func showErrorAlert(with message: String) {
        DispatchQueue.main.async {
            let alertVC = PMAlertController(title: "Error", description: message, image: UIImage(named: "sad_cloud.png"), style: .alert) //Image by icons8.com
            alertVC.addAction(PMAlertAction(title: "oh! sorry", style: .cancel, action: { () -> Void in
            }))
            UIApplication.topViewController()?.present(alertVC, animated: true, completion: nil)
        }
    }
}
