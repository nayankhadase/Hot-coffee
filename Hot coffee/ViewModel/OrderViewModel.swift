//
//  OrderViewModel.swift
//  Hot coffee
//
//  Created by nayan.khadase on 06/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation

// all orders
struct OrderListViewModel {
    var orders: [Order]
}
extension OrderListViewModel{
    init(_ orders: [Order]) {
        self.orders = orders
    }
}
extension OrderListViewModel{
    var numberOfSection: Int{
        return 1
    }
    
    var numberOfRowsInASection: Int{
        return orders.count
    }
    
    func getOrderDetails(for index: Int) -> OrderViewModel{
        return OrderViewModel(orders[index])
    }
}

// single order
struct OrderViewModel {
    let order: Order
    
    init(_ order: Order) {
        self.order = order
    }
}
extension OrderViewModel{
    var name: String{
        return order.name
    }
    var coffeeName: String{
        return order.coffeeName.rawValue
    }
    var total: String{
        return String(order.total)
    }
    var size: String{
        return order.size.rawValue.capitalized
    }
}
