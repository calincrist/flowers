//
//  OrderItem.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import Foundation

class OrderItem: Codable {
    let id: Double
    let description: String
    let price: Double
    let deliver_to: String
    let image_url: String
}

func == (lhs: OrderItem, rhs: OrderItem) -> Bool {
    return lhs.id == rhs.id
}
