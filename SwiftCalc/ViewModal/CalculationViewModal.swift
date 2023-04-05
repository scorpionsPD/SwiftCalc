//
//  CalculationViewModal.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 02/04/23.
//

import Foundation

class CalculationViewModal {
    private var acquirer: Double? {
        didSet {
            if let acu = acquirer {
                result?(acu)
            }
        }
    }
    private var pendingAction: PendingAction?
    private var resultIsPending = false
    private var onlineTask = OnlineTask()
    var result: ((Double) -> ())?
    private var actions: Dictionary<String, Action> = [
        "＋" : .doubleAction({ $0 + $1 }),
        "﹣" : .doubleAction({ $0 - $1 }),
        "×" : .doubleAction({ $0 * $1 }),
        "/" : .doubleAction({ $0 / $1 }),
        "sin" : .individualAction({sin($0 * Double.pi / 180)}),
        "cos" : .individualAction({cos($0 * Double.pi / 180)}),
        "₿" : .onlineAction({ $0 * $1 }),
        "AC": .constant(0),
        "=" : .result
    ]
    //MARK: Enumerations
    private enum Action {
        case constant(Double) /// to clear values
        case individualAction((Double) -> Double) /// for sin and cos
        case doubleAction((Double, Double) -> Double) /// for arithmetic calculations
        case onlineAction((Double, Double) -> Double) /// for bitcoin to USD conversion
        case result /// to return results
    }
    //MARK: Embedded struct
    private struct PendingAction {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    //MARK: Functions
    func executeAction(_ symbol: String) {
        if let action = actions[symbol] {
            switch action {
            case .constant(let value):
                acquirer = value
            case .individualAction(let function):
                if acquirer != nil {
                    acquirer = function(acquirer!)
                }
            case .doubleAction(let function):
                performPendingAction()
                if acquirer != nil {
                    pendingAction = PendingAction(function: function, firstOperand: acquirer!)
                    resultIsPending = true
                    acquirer = nil
                }
            case .result:
                performPendingAction()
            case .onlineAction(let function):
                onlineTask.convertToUSD({ value in
                    self.pendingAction = PendingAction(function: function, firstOperand: value)
                    self.performPendingAction()
                })
            }
        }
    }
    private func performPendingAction() {
        if pendingAction != nil && acquirer != nil {
            acquirer = pendingAction?.perform(with: acquirer!)
            pendingAction = nil
            resultIsPending = false
        }
    }
    func setOperand(_ operand: Double?) {
        acquirer = operand ?? 0.0
    }
}
