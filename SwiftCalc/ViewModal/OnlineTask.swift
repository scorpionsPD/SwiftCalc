//
//  OnlineTask.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 04/04/23.
//

import Foundation
import Networking

struct OnlineTask {
    /*
     function to fetch last updated USD value of bitcoin API reference from https://www.blockchain.com/explorer/api/exchange_rates_api
     */
    func convertToUSD(_ onSuccess: @escaping (Double) -> ()) {
        let listofPicsURL = "\(Constants.Backend.url)/ticker"
        let listResource = Resource<USDModal>(url: listofPicsURL, method: .get, p: {
            data -> USDModal in
            let pics = try? JSONDecoder().decode(USDModal.self, from: data)
            return pics!
        })
        Webservice.load(resource: listResource) { result in
            switch result {
            case .failure(let error):
                if let error = error as? NetworkError {
                    CustomAlert().showErrorAlert(error: error)
                }
                break
            case .success(let result):
                onSuccess(result["USD"]?.last ?? 0.0)
            }
        }
    }
}
