//
//  OneCategoryViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/14/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class OneCategoryViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    var thisFoodGroup: String = "All"
    var allFoods = FoodDicts.myFood
    var filteredFoodArray: [Food] = []
    @IBOutlet weak var foodTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFoodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let foodCell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as? OneCategoryViewCell {
            var thisFood: Food = allFoods[indexPath.row]
            if thisFoodGroup != "All" {
                thisFood = filteredFoodArray[indexPath.row]
            }
            foodCell.name.text = thisFood.name
            foodCell.number.text = String(thisFood.quantity)
            
            // Swipe functionality
            let padding = 15;
            
            let trash = MGSwipeButton(title: "Delete", backgroundColor: .red, padding: padding, callback: { (cell) -> Bool in
                self.deleteFood(self.foodTable.indexPath(for: cell)!);
                return false; //don't autohide to improve delete animation
            });
            
            let edit = MGSwipeButton(title: "Edit", backgroundColor: .lightGray, padding: padding, callback: { (cell) -> Bool in
                print("help how do I segue")
                return true; //autohide
            });
            
            foodCell.rightButtons = [edit, trash]
            foodCell.rightSwipeSettings.transition = .border
            
            return foodCell
        } else {
            print("Error creating food table view cell")
            return UITableViewCell()
        }
    }
    
    func deleteFood(_ path: IndexPath) {
        let toRemove: Food = filteredFoodArray[(path as NSIndexPath).row]
        
        //TODO: Delete permanently from CoreData
        
        filteredFoodArray.remove(at: (path as NSIndexPath).row);
        FoodDicts.myFood = FoodDicts.myFood.filter {$0.dateAdded != toRemove.dateAdded }
        allFoods = FoodDicts.myFood
        foodTable.deleteRows(at: [path], with: .left);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTable.delegate = self
        foodTable.dataSource = self
        populateFilteredFoods()
        
        // Do any additional setup after loading the view.
    }
    
    func populateFilteredFoods() {
        for food in allFoods {
            if (food.category.contains(thisFoodGroup) && !filteredFoodArray.contains(where: {$0.dateAdded == food.dateAdded})) || thisFoodGroup == "All" {
                filteredFoodArray.append(food)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
