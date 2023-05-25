//
//  OnlineTask.swift
//  SwiftCalc
//
//  Created by Pradeep Dahiya on 04/04/23.
//

import Foundation
import NetworkManager

struct OnlineTask {
    /*
     function to fetch last updated USD value of bitcoin API reference from https://www.blockchain.com/explorer/api/exchange_rates_api
     */
    func convertToUSD(_ onSuccess: @escaping (Double) -> ()) {
        
        let url = String(describing: "\(Constants.Backend.url)/ticker")
        
        NetworkManager.shared.request(urlString: url) { (result: Result<USDModal, NetworkError>) in
            switch result {
            case .success(let data):
                onSuccess(data["USD"]?.last ?? 0.0)
            case .failure(let error):
                CustomAlert().showErrorAlert(with: error.localizedDescription)
            }
        }
    }
}
