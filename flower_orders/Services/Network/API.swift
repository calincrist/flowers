//
//  API.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import Foundation

enum API {
    case getOrders
    case getOrderDetails(id: String)
    
    var scheme: String {
        switch self {
        case .getOrders, .getOrderDetails:
          return "https"
        }
    }
    
    var host: String {
      switch self {
      case .getOrders, .getOrderDetails:
        return "demo4860957.mockable.io"
      }
    }
    
    var path: String {
        switch self {
        case .getOrders:
            return "/orders"
        case .getOrderDetails(let id):
            return "/orders/\(id)"
        }
    }
    
    var method: String {
      switch self {
        case .getOrders, .getOrderDetails:
          return "GET"
      }
    }
}
