//
//  OnlineTask.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 04/04/23.
//

import Foundation

struct OnlineTask {
    func convertToUSD(_ onSuccess: @escaping (Double) -> ()) {
        let listofPicsURL = "\(Constants.Backend.url)/ticker"
        let listResource = Resource<USDModal>(url: listofPicsURL, method: .get) { data in
            let pics = try? JSONDecoder().decode(USDModal.self, from: data)
            return pics
        }
        Webservice.load(resource: listResource) { result in
            switch result {
            case .failure:
                print("something went wrong")
                break
            case .success(let result):
                onSuccess(result["USD"]?.last ?? 0.0)
            }
        }
    }
}
