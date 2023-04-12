//
//  NetworkReachablityTests.swift
//  SwiftCalcTests
//
//  Created by Pradeep Dahiya on 11/04/23.
//

import XCTest
@testable import SwiftCalc

class NetworkReachablityTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testReachablity() throws {
        XCTAssertTrue(Reachability.isConnectedToNetwork())
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
