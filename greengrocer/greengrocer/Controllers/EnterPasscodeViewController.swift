//
//  EnterPasscodeViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/28/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit

class EnterPasscodeViewController: UIViewController {
    
    var selectedUser: User = FoodDicts.fakeUser1
    
    @IBOutlet weak var helloText: UILabel!
    @IBOutlet weak var enteredPasscode: UITextField!
    @IBOutlet weak var confirm: UIButton!
    
    @IBAction func didPressX(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didPressConfirm(_ sender: UIButton) {
        if let passcode = Int(enteredPasscode.text!) {
            if selectedUser.passcode == passcode {
                FoodDicts.currentUser = selectedUser
                let titleText = "Welcome, " + selectedUser.name + "!"
                let alertController3 = UIAlertController(title: titleText, message: "🍎🍌", preferredStyle: .alert)
                let action3 = UIAlertAction(title: "Continue", style: .default) { (action:UIAlertAction) in
                    self.performSegue(withIdentifier: "toMain", sender: sender)
                }
                alertController3.addAction(action3)
                self.present(alertController3, animated: true, completion: nil)
  
                return
            }
            let alertController1 = UIAlertController(title: "Incorrect Passcode!", message: "Please try again.", preferredStyle: .alert)
            let defaultAction1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController1.addAction(defaultAction1)
            self.present(alertController1, animated: true, completion: nil)
            
        } else {
            let alertController2 = UIAlertController(title: "Passcode Error.", message: "Passcode must be a number", preferredStyle: .alert)
            let defaultAction2 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController2.addAction(defaultAction2)
            self.present(alertController2, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        confirm.layer.cornerRadius = 10
        confirm.layer.shadowColor = UIColor.gray.cgColor;
        confirm.layer.shadowOpacity = 0.8;
        confirm.layer.shadowRadius = 5;
        confirm.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        helloText.text = "Hello, " + selectedUser.name + "!"
        
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        enteredPasscode.resignFirstResponder()
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
