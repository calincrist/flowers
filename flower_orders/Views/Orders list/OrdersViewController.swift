//
//  ViewController.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 27/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    var viewModel: OrdersViewModel!
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }
}

//  MARK:- UI
extension OrdersViewController {
    func setupTableView() {
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
}

extension OrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        
        let orderItem = viewModel.orders[indexPath.row]
        cell.configure(with: orderItem)
        
        return cell
    }
    
    
}

extension OrdersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderItem = viewModel.orders[indexPath.row]
        coordinator?.showDetails(for: orderItem)
    }
}


//  MARK:- View model interaction
extension OrdersViewController {
    @objc func fetchData() {
        viewModel.fetchOrders {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
}

extension OrdersViewController {
    static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func instantiate(inject viewModel: OrdersViewModel) -> OrdersViewController {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let viewController = getStoryboard().instantiateViewController(identifier: className) as! OrdersViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
}
