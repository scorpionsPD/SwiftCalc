//
//  Resource.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 04/04/23.
//

import Foundation
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
struct Resource<A> {
    let url: String
    let method: HTTPMethod
    let parse: (Data) -> A?
}
