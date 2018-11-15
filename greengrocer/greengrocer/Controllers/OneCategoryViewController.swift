//
//  OneCategoryViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/14/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit

class OneCategoryViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    var thisFoodGroup: String = "All"
    var allFoods = FoodDicts.myFood
    var filteredFoodArray: [Food] = []
    @IBOutlet weak var foodTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if thisFoodGroup != "All" {
            for food in allFoods {
                if food.category.contains(thisFoodGroup) && !filteredFoodArray.contains(food) {
                    filteredFoodArray.append(food)
                
                }
            }
            print(filteredFoodArray.count)
            return filteredFoodArray.count
        } else {
            return allFoods.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let foodCell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as? OneCategoryViewCell {
            var thisFood: Food = allFoods[indexPath.row]
            if thisFoodGroup != "All" {
                thisFood = filteredFoodArray[indexPath.row]
            }
            foodCell.name.text = thisFood.name
            foodCell.number.text = String(thisFood.quantity)
            return foodCell
        } else {
            print("Error creating poke table view cell")
            return UITableViewCell()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTable.delegate = self
        foodTable.dataSource = self

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
