//
//  AddOrderViewModel.swift
//  Hot coffee
//
//  Created by nayan.khadase on 06/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation
struct AddOrderViewModel {
    
    var name: String?
    var qty: Double?
    var selectedType: String?
    var selectedSize: String?
    
    func getCoffeeTypeCount() -> Int{
        return CoffeeType.allCases.count
    }
    func getCoffeeTypeName() -> [String]{
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    func getCoffeeTypeSize() -> [String]{
        return CoffeeSize.allCases.map{ $0.rawValue.capitalized }
    }
}
