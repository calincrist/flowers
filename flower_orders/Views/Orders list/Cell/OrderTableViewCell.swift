//
//  OrderTableViewCell.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import UIKit
import SDWebImage

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderDescription: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderDestination: UILabel!
}

extension OrderTableViewCell {
    func configure(with item: OrderItem) {
        orderDescription.text = item.description
        orderPrice.text = "$\(item.price)"
        orderDestination.text = "For \(item.deliver_to)"
        orderImage.sd_setImage(with: URL(string: item.image_url),
                               placeholderImage: nil)
        orderImage.layer.cornerRadius = 8
    }
}
