//
//  AppCoordinator.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
    }

    func start() {
        let viewModel = OrdersViewModel(networkService: OrdersService())
        let viewController = OrdersViewController.instantiate(inject: viewModel)
        viewController.coordinator = self
        viewController.title = "Orders"
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetails(for orderItem: OrderItem) {
        let viewModel = DetailsViewModel(orderItem: orderItem)
        let viewController = DetailsViewController.instantiate(inject: viewModel)
        viewController.title = "For \(orderItem.deliver_to)"
        
        navigationController.pushViewController(viewController, animated: false)
    }
}
