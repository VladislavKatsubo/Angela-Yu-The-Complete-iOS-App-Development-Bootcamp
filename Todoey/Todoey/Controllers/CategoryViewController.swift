//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Vlad Katsubo on 21.09.22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.backgroundColor = UIColor(hexString: "1D9BF6")
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let category = categories?[indexPath.row] else { fatalError("no category") }
        guard let categoryColor = UIColor(hexString: category.cellColor) else { fatalError("no category color")}
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if category.cellColor != "" {
            cell.backgroundColor = categoryColor
        }
        cell.textLabel?.text = category.name
        cell.textLabel?.textColor = ContrastColorOf(categoryColor, returnFlat: true)
        return cell
    }
    
    //MARK: - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDoListItem", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    //MARK: - Adding items to the array
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Add", style: .default) { _ in
            if let newCategoryText = ac.textFields?[0].text {
                
                let newCategory = Category()
                newCategory.name = newCategoryText
                newCategory.cellColor = UIColor.randomFlat().hexValue()
                self.saveToDB(newCategory)
            }
        })
        present(ac, animated: true)
    }
    //MARK: - Deleting items from array
    
    override func updateModel(at indexPath: IndexPath) {
        if let categoryToDelete = categories?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(categoryToDelete)
                }
            } catch {
                print("Error while deleting object from arra: \(error)")
            }
        }
        
    }
    
    //MARK: - Data methods
    
    func saveToDB(_ category: Category) {
        
        do {
            try realm.write({
                realm.add(category)
            })
        } catch {
            print("Error while saving data: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    
}


