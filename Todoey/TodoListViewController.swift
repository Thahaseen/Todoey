//
//  ViewController.swift
//  Todoey
//
//  Created by APPLE on 11/07/18.
//  Copyright © 2018 APPLE. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var  itemArray = ["heart rate","stroke volume","cardiac output","HRV","intensity"]
   let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
      if let  items = defaults.array(forKey: "TodoListArray") as? [String]
      { itemArray = items
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
//    mark - table datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoIteamCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
return cell
    }
//    mark - tableView Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
//    mark - add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
      
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the add item button on our UIAlert
//            print("add item pressed")
            print(textField.text)
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            print(alertTextField.text)
            textField = alertTextField
            
            
            print(alertTextField.text)
            print("now")
        }
            
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

