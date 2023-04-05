//
//  CalculatorViewController.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 02/04/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    private var isTyping = false
    private var vm = CalculationViewModal()
    private var displayValue: Double {
        get {
            return Double(display.text ?? Constants.emptyString) ?? Double.nan
        }
        set {
            DispatchQueue.main.async { [weak self] in
                self?.display.text = String(newValue)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // Action to perform on any digit press from 0-9
    @IBAction func digitsPress(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        if isTyping {
            guard let text = display.text else { return }
            
            if digit == "." && (text.range(of: Constants.decimalPoint) != nil) {
                return
            } else {
                let tmp = text + digit
                display.text = tmp
            }
            
        } else {
            if digit == Constants.decimalPoint {
                display.text = Constants.pointAfterZero
            } else {
                display.text = digit
            }
            isTyping = true
        }
    }
    // Action to perform on any symbol press from includding sin and cos
    @IBAction func symbolPress(_ sender: UIButton) {
        if isTyping {
            vm.setOperand(displayValue)
            isTyping = false
        }
        if let action = sender.currentTitle {
            vm.executeAction(action)
        }
        vm.result = { value in
            self.displayValue = value
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
