//
//  ViewController.swift
//  Lab7
//
//  Created by Trang Nguyen on 2025-02-18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
       
    var timesTable: [String] = []
    var foods: [String]?
    var unhealthyFoods: [String]?
    var healthyFoods: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        numberTextField.keyboardType = .numberPad
        
        foods = ["Apple", "Banana", "Burger", "Fries", "Orange", "Pizza"]
        unhealthyFoods = ["Burger", "Fries", "Pizza"]
        healthyFoods = ["Apple", "Banana", "Orange"]
    }
    
    
    @IBAction func generateTimesTable(_ sender: UIButton) {
        guard let inputText = numberTextField.text, let number = Int(inputText) else {
            // Alert if not valid number
            let alert = UIAlertController(title: "Invalid input", message: "Please enter an integer number.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        timesTable = (1...10).map {
            "\($0) x \(number) = \($0 * number)"
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timesTable.count
    }
    
    func tableView (_ tabelView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        let timetableEntry = timesTable[indexPath.row]
        cell.textLabel?.text = timetableEntry
        return cell
    }
}

