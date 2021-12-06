//
//  AddOrderViewController.swift
//  Hot coffee
//
//  Created by nayan.khadase on 03/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var surnameLabel: UITextField!
    
    
    
    var arr: [AddOrderViewModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        WebService().load(fileName: "ordersList") { (orders) in
            if let orders = orders{
                self.arr = orders as! [AddOrderViewModel]
            }
        }
        
    }
    
    @IBAction func qtySelector(_ sender: UISegmentedControl) {
        
    }
    @IBAction func saveOrder(_ sender: UIBarButtonItem) {
        
        //// Write that JSON to the file created earlier
        let a = AddOrderViewModel(name: "rahul", coffeeName: coffeeType.Espresso.rawValue, total: 1.0, size: coffeeSize.Large.rawValue)
        
        arr?.insert(a, at: 0)
        if let addOrder = arr{
            WebService().writeData(for: "ordersList", orderDetails: addOrder)
        }
       
        
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
//    func writeToFile(location: URL) {
//        do{
//
//            let encoder = JSONEncoder()
//            let JsonData = try encoder.encode(arr)
//             print(JsonData.debugDescription)
//            try JsonData.write(to: location)
//            print("data added successfully")
//        }catch{
//            fatalError("error while encoding data: ")
//        }
//    }
    
    
  
    
}
