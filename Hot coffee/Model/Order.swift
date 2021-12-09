//
//  Order.swift
//  Hot coffee
//
//  Created by nayan.khadase on 03/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case Latte
    case Cappuccino
    case Americano
    case Espresso
    case Doppio
}
enum CoffeeSize: String, Codable, CaseIterable {
    case Small
    case Medium
    case Large
}

// order model
struct Order: Codable {
    let name: String
    let coffeeName: CoffeeType
    let total: Double
    let size: CoffeeSize
}

// optional initializer
extension Order{
    init?(_ addVM: AddOrderViewModel) {
        guard let name = addVM.name,
        let qty = addVM.qty,
            let selectedType = CoffeeType(rawValue: (addVM.selectedType)!),
            let selectedSize = CoffeeSize(rawValue: (addVM.selectedSize)!) else{
                return nil
        }
        self.name = name
        self.total = qty
        self.coffeeName = selectedType
        self.size = selectedSize
    }
    
}
