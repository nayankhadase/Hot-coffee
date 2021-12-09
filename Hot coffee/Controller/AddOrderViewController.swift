//
//  AddOrderViewController.swift
//  Hot coffee
//
//  Created by nayan.khadase on 03/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {

    @IBOutlet weak var stepperLabel: UIStepper!
    @IBOutlet weak var showQty: UILabel!
    @IBOutlet var uiSegmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var qty: UITextField!
    
    var qtyValue: Double?
    var segmentIndex: Int = 1
    var addOrderViewModel = AddOrderViewModel()
    
    var arr: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        qtyValue = 1.0
        WebService().load(fileName: "ordersList") { (orders) in
            if let orders = orders{
                self.arr = orders
            }
        }
        
    }
    
    @IBAction func qtyStepper(_ sender: UIStepper) {
       qtyValue = sender.value
        qty.text = "\(qtyValue)"
    }
    
    @IBAction func sizeSelector(_ sender: UISegmentedControl) {
        print("index: \(sender.selectedSegmentIndex)")
        segmentIndex = sender.selectedSegmentIndex
    }
    
    
    @IBAction func saveOrder(_ sender: UIBarButtonItem) {
        //// Write that JSON to the file created earlier
        
        let segmentedControlSelected = uiSegmentedControlOutlet.titleForSegment(at: segmentIndex)
        
        guard let selectedIndex = self.tableView.indexPathForSelectedRow else{
            fatalError("error while selecting index path")
        }
        
        let sizeSelected = addOrderViewModel.getCoffeeTypeName()[selectedIndex.row]
        
        
        guard let a = Order(AddOrderViewModel(name: nameLabel.text, qty: qtyValue, selectedType: sizeSelected, selectedSize: segmentedControlSelected)) else{fatalError("error ehile creating order object: ")}
        
        arr?.insert(a, at: 0)
        WebService().writeData(for: K.jsonFileName, orderDetails: arr!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addOrderViewModel.getCoffeeTypeCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.addOrderTVcellIdentifier, for: indexPath)
        cell.textLabel?.text = addOrderViewModel.getCoffeeTypeName()[indexPath.row]
        return cell
    }
    
    // apply checkmark
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}
