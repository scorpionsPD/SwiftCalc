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
        let currentTheme = ThemeOrganizer.currentTheme()
        self.isUserInteractionEnabled = isActive
        self.backgroundColor = isActive ? currentTheme.symbolsBackgroundColor : .lightGray
    }
    private func setup() {
        if let title = self.currentTitle {
            setState(isActive: Customization().checkForState(title))
        } else { self.backgroundColor = .clear }
    }
}
