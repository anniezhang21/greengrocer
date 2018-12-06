//
//  IntroViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var loadedFoods: [SavedFood] = []
    var selectedUser: User = FoodDicts.fakeUser1
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var userCollection: UICollectionView!
    
    @IBAction func didPressAddUser(_ sender: Any) {
        performSegue(withIdentifier: "toAddHousemate", sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        fetchFoodFromCoreData()
        if let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? userCollectionViewCell {
            self.selectedUser = FoodDicts.housemates[indexPath.item]
            performSegue(withIdentifier: "toEnterPasscode", sender: userCell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodDicts.housemates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? userCollectionViewCell {
            
            let user = FoodDicts.housemates[indexPath.item]
            
            userCell.fridgeImage.image = UIImage(named: "fridge")
            userCell.userLabel.text = user.name + "'s Fridge"
            
            return userCell
        }
        // If cannot cast, just return a dummy cell
        print("Error casting cell as a userCell")
        return UICollectionViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? EnterPasscodeViewController {
            destinationVC.selectedUser = self.selectedUser
        }
    }
    
    func fetchFoodFromCoreData() {
        do {
            loadedFoods = try context.fetch(SavedFood.fetchRequest())
            for sfood in loadedFoods {
                let currFood =  Food(category: sfood.category!, name: sfood.name!, quantity: sfood.quantity, price: sfood.price)
                currFood.dateAdded = sfood.dateAdded!
                currFood.marked = sfood.marked
                currFood.shared = sfood.shared
                currFood.owner = sfood.owner ?? "None"
                FoodDicts.myFood.append(currFood)
            }
            print("number of food items: " + String(FoodDicts.myFood.count))
        }
        catch {
            print("Fetch failed! :(")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userCollection.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        userCollection.delegate = self
        userCollection.dataSource = self
        
        addButton.layer.cornerRadius = 10
        addButton.layer.shadowColor = UIColor.gray.cgColor;
        addButton.layer.shadowOpacity = 0.5;
        addButton.layer.shadowRadius = 3;
        addButton.layer.shadowOffset = CGSize(width: 5, height: 5)
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
