//
//  DetailsViewModel.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 02/09/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    var orderItem: OrderItem!
    
    var orderThumbnailURL: URL? {
        URL(string: orderItem.image_url)
    }
    var orderDescription: String {
        "\(orderItem.description) bouquet"
    }
    var orderPrice: String {
        "$\(orderItem.price)"
    }
    
    init(orderItem: OrderItem) {
        self.orderItem = orderItem
    }
}
