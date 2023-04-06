//
//  CalcBtn.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 05/04/23.
//

import Foundation

import UIKit

final class CalcBtn: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    private func setState(isActive:Bool) {
        self.isUserInteractionEnabled = isActive
        self.backgroundColor = isActive ? .systemOrange : .lightGray
    }
    private func setup() {
        setState(isActive: Customization.shared.checkForState(self.currentTitle!))
    }
}
