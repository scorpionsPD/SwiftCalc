//
//  OnlineTask.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 04/04/23.
//

import Foundation

struct OnlineTask {
    /*
     function to fetch last updated USD value of bitcoin API reference from https://www.blockchain.com/explorer/api/exchange_rates_api
     */
    func convertToUSD(_ onSuccess: @escaping (Double) -> ()) {
        let listofPicsURL = "\(Constants.Backend.url)/ticker"
        let listResource = Resource<USDModal>(url: listofPicsURL, method: .get) { data in
            let pics = try? JSONDecoder().decode(USDModal.self, from: data)
            return pics
        }
        Webservice.load(resource: listResource) { result in
            switch result {
            case .failure(let error):
                CustomAlert().showErrorAlert(error: error as! NetworkError)
                break
            case .success(let result):
                onSuccess(result["USD"]?.last ?? 0.0)
            }
        }
    }
}
