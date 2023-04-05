//
//  USDModal.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 04/04/23.
//

import Foundation
// MARK: - USDModalValue
struct USDModalValue: Codable {
    let last: Double
    enum CodingKeys: String, CodingKey {
        case last
    }
}

typealias USDModal = [String: USDModalValue]
