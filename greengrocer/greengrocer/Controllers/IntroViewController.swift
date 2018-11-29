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
    
    @IBOutlet weak var startStocking: UIButton!
    @IBOutlet weak var userCollection: UICollectionView!
    
    @IBAction func viewTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toEnterPasscode", sender: UIButton())
        fetchFoodFromCoreData()
    }
    
    func fetchFoodFromCoreData() {
        do {
            loadedFoods = try context.fetch(SavedFood.fetchRequest())
            for sfood in loadedFoods {
                let currFood =  Food(category: sfood.category!, name: sfood.name!, quantity: sfood.quantity, price: sfood.price)
                currFood.dateAdded = sfood.dateAdded!
                currFood.marked = sfood.marked
                currFood.shared = sfood.shared
                FoodDicts.myFood.append(currFood)
            }
        }
        catch {
            print("Fetch failed! :(")
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userCollection.delegate = self
        userCollection.dataSource = self
        
        // Do any additional setup after loading the view.
        startStocking.layer.cornerRadius = 10
        startStocking.layer.shadowColor = UIColor.gray.cgColor;
        startStocking.layer.shadowOpacity = 0.8;
        startStocking.layer.shadowRadius = 5;
        startStocking.layer.shadowOffset = CGSize(width: 8, height: 8)
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
