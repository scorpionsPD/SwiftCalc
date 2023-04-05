//
//  Webservice.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 04/04/23.
//
import UIKit
enum NetworkError: Error {
    case parseUrl
    case parseJson
    case parseData
    case emptyResource
}
enum Webservice {
    @discardableResult
    static func load<A>(resource: Resource<A>?, completion: @escaping (Result<A, Error>) -> Void) -> URLSessionTask? {
        guard let resource = resource else {
            completion(.failure(NetworkError.emptyResource))
            return nil
        }
        guard let url = URL(string: resource.url) else {
            completion(.failure(NetworkError.parseUrl))
            return nil
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(error!))
                return
            }
            guard let result = resource.parse(data) else {
                completion(.failure(NetworkError.parseData))
                return
            }
            completion(.success(result))
        }
        task.resume()
        return task
    }
}
