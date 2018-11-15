//
//  IntroViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    
    
    @IBOutlet weak var fridge: UIImageView!
    @IBOutlet weak var startStocking: UIButton!
    
    @IBAction func viewTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toHomeScreen", sender: UIButton())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startStocking.layer.cornerRadius = 10
        startStocking.layer.shadowColor = UIColor.gray.cgColor;
        startStocking.layer.shadowOpacity = 0.8;
        startStocking.layer.shadowRadius = 5;
        startStocking.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        fridge.image = #imageLiteral(resourceName: "fridge")
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
