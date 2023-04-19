//
//  Utils.swift
//  Planets
//
//  Created by Pradeep Dahiya on 18/04/23.
//

import Foundation

class Utils {
    
    class func save(_ symbols: [Settings]) {
        let data = symbols.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: Constants.KeyForUserDefaults)
    }
    class func load() -> [Settings]? {
        guard let encodedData = UserDefaults.standard.array(forKey: Constants.KeyForUserDefaults) as? [Data] else {
            return nil
        }
        return encodedData.map { try! JSONDecoder().decode(Settings.self, from: $0) }
    }
}
