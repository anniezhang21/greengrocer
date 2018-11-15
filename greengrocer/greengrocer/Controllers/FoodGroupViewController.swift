//
//  FoodGroupViewCOntroller.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit

class FoodGroupViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var viewAll: UIButton!
    @IBOutlet weak var addFood: UIButton!
    @IBOutlet weak var foodGroupCollection: UICollectionView!
    var groupToShow: String = "All"
    var filteredFoods: [Food] = []

    @IBAction func didPressViewAll(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCategory", sender: UIButton.self)
    }
    @IBAction func didAddFood(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddFood", sender: UIButton())
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodDicts.categoryDict.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let groupCell = collectionView.dequeueReusableCell(withReuseIdentifier: "groupCell", for: indexPath) as? FoodGroupCollectionViewCell {
            groupCell.layer.cornerRadius = 5;
            // Add in image
            
            print("casted successfully")
            groupCell.name.text = FoodDicts.categoryDict[indexPath.item]
            if let bgImage = FoodDicts.imageDict[indexPath.item] as? UIImage {
                let View = UIView()
                View.backgroundColor=UIColor(patternImage: bgImage)
                groupCell.backgroundView = View
            }
            return groupCell
        }
        // If cannot cast, just return a dummy cell
        print("Error casting cell as a groupCell")
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let groupCell = collectionView.dequeueReusableCell(withReuseIdentifier: "groupCell", for: indexPath) as? FoodGroupCollectionViewCell {
            self.groupToShow = FoodDicts.categoryDict[indexPath.item]!
            performSegue(withIdentifier: "goToCategory", sender: groupCell)
        }
        
    }
    
    // need to send the type int somehow
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? OneCategoryViewController {
            destinationVC.thisFoodGroup = self.groupToShow
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodGroupCollection.delegate = self
        foodGroupCollection.dataSource = self
        
        viewAll.layer.cornerRadius = 10
        
        addFood.layer.cornerRadius = 10
        addFood.layer.shadowColor = UIColor.gray.cgColor;
        addFood.layer.shadowOpacity = 0.8;
        addFood.layer.shadowRadius = 3;
        addFood.layer.shadowOffset = CGSize(width: 5, height: 5)

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
