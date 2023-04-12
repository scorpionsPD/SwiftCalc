//
//  CalculationVMTests.swift
//  SwiftCalcTests
//
//  Created by Pradeep Dahiya on 11/04/23.
//

import XCTest
@testable import SwiftCalc

class CalculationVMTests: XCTestCase {
    
    var vm:CalculationViewModal!
    
    override func setUp() {
        vm = CalculationViewModal()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_addition() throws {
        vm.setOperand(4) // setting up first operand
        vm.executeAction("＋") // operator
        vm.setOperand(5) // setting up second operand
        vm.executeAction("=") // results
        vm.result = { val in
            XCTAssertEqual(val, 9.0) // expected result
        }
    }
    func test_substraction() throws {
        vm.executeAction("AC")
        vm.setOperand(4) // setting up first operand
        vm.executeAction("﹣") // operator
        vm.setOperand(5) // setting up second operand
        vm.result = { val in
            XCTAssertEqual(val, -1.0) // expected result
        }
        vm.executeAction("=") // results
        
    }
    func test_ac() {
        vm.result = { val in
            XCTAssertEqual(val, 0.0)
        }
        vm.executeAction("AC")
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
