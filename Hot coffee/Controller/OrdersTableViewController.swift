//
//  OrdersTableViewController.swift
//  Hot coffee
//
//  Created by nayan.khadase on 03/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController {

    var orderListViewModel: OrderListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    override func viewDidAppear(_ animated: Bool) {
        getdata()
    }
    
    
    func getdata(){
        WebService().load(fileName: K.jsonFileName){ orders in
            if let orders = orders{
                self.orderListViewModel = OrderListViewModel(orders)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return orderListViewModel?.numberOfSection ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderListViewModel?.numberOfRowsInASection ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.ordersTVCellIdentifier, for: indexPath) as? OrdersTableViewCell else{ return UITableViewCell() }

        let orderVM = orderListViewModel?.getOrderDetails(for: indexPath.row)
        cell.name.text = orderVM?.coffeeName
        cell.size.text = orderVM?.size
        cell.qty.text = orderVM?.total
        //print(orderVM?.total)
        return cell
    }
 

    

}
