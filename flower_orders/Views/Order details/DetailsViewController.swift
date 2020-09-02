//
//  DetailsViewController.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var orderThumbnail: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        descriptionLabel.text = viewModel.orderDescription
        priceLabel.text = viewModel.orderPrice
        orderThumbnail.sd_setImage(with: viewModel.orderThumbnailURL,
        placeholderImage: nil)
        orderThumbnail.layer.cornerRadius = 8
    }
}

extension DetailsViewController {
    static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func instantiate(inject viewModel: DetailsViewModel) -> DetailsViewController {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let viewController = getStoryboard().instantiateViewController(identifier: className) as! DetailsViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
}
