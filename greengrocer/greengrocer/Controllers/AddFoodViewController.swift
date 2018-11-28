//
//  AddFoodViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit
import CoreData

class AddFoodViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var newFood: Food = Food(category: "Grains", name: "ERROR", quantity: -1, price: -1)
    
    
    @IBOutlet weak var foodGroupPicker: UIPickerView!
    
    @IBOutlet weak var isShared: UISwitch!
    
    @IBOutlet weak var foodGroupText: UITextField!
    @IBOutlet weak var itemNameText: UITextField!
    @IBOutlet weak var quantityText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var openFridge: UIImageView!
    @IBOutlet weak var confirm: UIButton!
    
    @IBAction func didPressX(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func didPressConfirm(_ sender: Any) {
        if let groupText = foodGroupText.text, let nameText = itemNameText.text, let quantText = quantityText.text, let pText = priceText.text {
            newFood = Food(category: groupText, name: nameText, quantity: Double(quantText) ?? 0, price: Double(pText) ?? 0)
            newFood.shared = isShared.isOn
            newFood.dateAdded = Date.init()
            FoodDicts.myFood.append(newFood)
            if isShared.isOn {
                // TODO: FireBase storage
            } else {
                // Local storage
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context =  appDelegate.persistentContainer.viewContext
                
                let pfood = SavedFood(context: context)
                pfood.category = newFood.category
                pfood.dateAdded = newFood.dateAdded
                pfood.marked = newFood.marked
                pfood.name = newFood.name
                pfood.price = newFood.price
                pfood.quantity = newFood.quantity
                pfood.shared = newFood.shared
                
                appDelegate.saveContext()
                
                // Uncomment to clear all stored data
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedFood")
//                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//                
//                do {
//                    try context.execute(deleteRequest)
//                } catch let error as NSError {
//                    print(error)
//                }
            }
            dismiss(animated: true)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return FoodDicts.categoryDict.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return FoodDicts.categoryDict[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.foodGroupText.text = FoodDicts.categoryDict[row]
        self.foodGroupPicker.isHidden = true
    }
    
    @IBAction func textFieldDidBeginEditing(_ sender: Any) {
        self.view.endEditing(true)
        self.foodGroupPicker.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodGroupPicker.delegate = self
        foodGroupPicker.dataSource = self
        
        foodGroupPicker.isHidden = true
        quantityText.keyboardType = UIKeyboardType.decimalPad
        
        openFridge.image = #imageLiteral(resourceName: "openfridge")
        
        confirm.layer.cornerRadius = 10
        confirm.layer.shadowColor = UIColor.gray.cgColor;
        confirm.layer.shadowOpacity = 0.5;
        confirm.layer.shadowRadius = 3;
        confirm.layer.shadowOffset = CGSize(width: 5, height: 5)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
