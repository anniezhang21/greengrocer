//
//  AddUserViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 12/6/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit
import CoreData

class AddUserViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var passcode: UITextField!
    
    @IBAction func didPressAdd(_ sender: Any) {
        guard let nameText = name.text else { return }
        guard let passCodeString = passcode.text else { return }
        guard let passCodeInt = Int(passCodeString) else { return }
        
        let newUser = User(name: nameText, passcode: passCodeInt)
        
        FoodDicts.housemates.append(newUser)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context =  appDelegate.persistentContainer.viewContext
        let user = SavedUser(context: context)
        user.name = newUser.name
        user.passcode = Int16(newUser.passcode)
        appDelegate.saveContext()
        
        dismiss(animated: true)
    }
    
    @IBAction func didpressX(_ sender: Any) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passcode.keyboardType = UIKeyboardType.decimalPad


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
