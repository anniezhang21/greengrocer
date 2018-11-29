//
//  SharedFoodViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/28/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class SharedFoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var sharedFoodArray: [Food] = []
    
    @IBOutlet weak var sharedFoodTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedFoodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let foodCell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as? OneCategoryViewCell {
            let thisFood: Food = sharedFoodArray[indexPath.row]
            foodCell.name.text = thisFood.name
            if floor(thisFood.quantity) == thisFood.quantity {
                foodCell.number.text = String(Int(thisFood.quantity))
            } else {
                foodCell.number.text = String(thisFood.quantity)
            }
            let daysSince = Int(round(thisFood.dateAdded.timeIntervalSinceNow / 86400 * -1))
            foodCell.dateAdded.text = "Added " + String(daysSince) + " day(s) ago"
            foodCell.categoryImage.image = FoodDicts.categoryImageDict[thisFood.category]
            
            // Swipe functionality
            let padding = 15;
            
            let trash = MGSwipeButton(title: "Delete", backgroundColor: .red, padding: padding, callback: { (cell) -> Bool in
                self.deleteFood(self.sharedFoodTable.indexPath(for: cell)!);
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
    
    func populateSharedFoods() {
        for food in FoodDicts.myFood {
            if !sharedFoodArray.contains(where: {$0.dateAdded == food.dateAdded}) && food.shared {
                sharedFoodArray.append(food)
            }
        }
    }
    
    func deleteFood(_ path: IndexPath) {
        let toRemove: Food = sharedFoodArray[(path as NSIndexPath).row]
        
        //TODO: Delete permanently from CoreData
        
        sharedFoodArray.remove(at: (path as NSIndexPath).row);
        FoodDicts.myFood = FoodDicts.myFood.filter {$0.dateAdded != toRemove.dateAdded }
        sharedFoodTable.deleteRows(at: [path], with: .left);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        populateSharedFoods()
        self.sharedFoodTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sharedFoodTable.delegate = self
        sharedFoodTable.dataSource = self
        populateSharedFoods()

        // Do any additional setup after loading the view.
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
