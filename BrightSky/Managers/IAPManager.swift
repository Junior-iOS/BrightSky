//
//  IAPManager.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import Foundation
import RevenueCat

final class IAPManager: NSObject {
    static let shared = IAPManager()
    
    private override init() {}
    
    func isSubscribed(completion: @escaping (Bool) -> Void) {
        Purchases.shared.getCustomerInfo { info, error in
            guard error == nil, let subscriptions = info?.activeSubscriptions else { return }
            print("SUBSCRIPTIONS: ", subscriptions)
            completion(!subscriptions.isEmpty)
        }
    }
}
