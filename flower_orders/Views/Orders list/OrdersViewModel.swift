//
//  OrdersViewModel.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

class OrdersViewModel {
    
    var networkService: OrdersService!
    var orders: [OrderItem] = []
    
    init(networkService: OrdersService) {
        self.networkService = networkService
    }
    
    func fetchOrders(_ callback: @escaping () -> Void) {
        networkService.fetchOrders { (orders) in
            self.orders = orders
            callback()
        }
    }
}
