//
//  Order.swift
//  Hot coffee
//
//  Created by nayan.khadase on 03/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation

enum coffeeType: String, Codable {
    case Latte
    case Cappuccino
    case Americano
    case Espresso
    case Doppio
}
enum coffeeSize: String, Codable {
    case Small
    case Medium
    case Large
}

// order model
struct Order: Codable {
    let name: String
    let coffeeName: coffeeType
    let total: Double
    let size: coffeeSize
}

//"name": "John Doe",
//"coffeeName": "Hot Coffee",
//"total": 4.5,
//"size": "Medium"

