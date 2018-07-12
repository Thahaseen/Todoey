//
//  ViewController.swift
//  Todoey
//
//  Created by APPLE on 11/07/18.
//  Copyright © 2018 APPLE. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
  var itemArray = [Item]()
    
    
//    var  itemArray = ["heart rate","stroke volume","cardiac output","HRV","intensity","respiratory rate","total body water","oxgyen level"]
   let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = " Heart rate"
//        newItem.done = true
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = " Heart rate variability"
//        newItem2.done = true
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "cardiac output"
//        newItem3.done = true
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "stroke volume"
//        newItem4.done = true
        itemArray.append(newItem4)
        
        let newItem5 = Item()
        newItem5.title = "respiratory rate"
//        newItem5.done = true
        itemArray.append(newItem5)
        
        let newItem6 = Item()
        newItem6.title = "total body water"
//        newItem6.done = true
        itemArray.append(newItem6)
        
        let newItem7 = Item()
        newItem7.title = "blood pressure"
//        newItem7.done = true
        itemArray.append(newItem7)
        
        let newItem8 = Item()
        newItem8.title = "ECG"
//        newItem8.done = true
        itemArray.append(newItem8)
        
//        itemArray.append(newItem8)
//        itemArray.append(newItem7)
//        itemArray.append(newItem6)
//        itemArray.append(newItem5)
//        itemArray.append(newItem4)
//        itemArray.append(newItem3)
//        itemArray.append(newItem2)
//        itemArray.append(newItem)
//        itemArray.append(newItem8)
//        itemArray.append(newItem7)
//        itemArray.append(newItem6)
//        itemArray.append(newItem5)
//        itemArray.append(newItem4)
//        itemArray.append(newItem3)
//        itemArray.append(newItem2)
//        itemArray.append(newItem)
//
        
      if let  items = defaults.array(forKey: "TodoListArray") as? [Item]
      { itemArray = items
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
//    mark - table datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("cellForRowAtIndexpath called")
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "TodoItemCell")
        
     let cell  = tableView.dequeueReusableCell(withIdentifier: "TodoIteamCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
//        ternary operator ==>
        //        valve = condition ? valveIfTrue : valveIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
//        if item.done == true
//        {
//            cell.accessoryType = .checkmark
//        }
//        else{
//            cell.accessoryType = .none
//
//
//        }
        
        
        
        
        
        
return cell
    }
//    mark - tableView Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
//      if  itemArray[indexPath.row].done == false
//      {
//        itemArray[indexPath.row].done = true
//        }
//      else{
//        itemArray[indexPath.row].done == false
//        }
//
        
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
//        {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
//
        tableView.reloadData()
        
        
        
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
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
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

