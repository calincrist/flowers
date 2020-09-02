//
//  OrdersService.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import Foundation

class OrdersService {
    func fetchOrders(_ callback: @escaping ([OrderItem]) -> Void) {
        ServiceLayer.request(router: .getOrders) { (result: Result<[OrderItem], Error>)  in
            switch result {
            case .success:
                let orders = try! result.get()
                callback(orders)
            case .failure:
                print(result)
            }
        }
    }
}
