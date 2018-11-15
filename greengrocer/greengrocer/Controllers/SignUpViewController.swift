//
//  SignUpViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/14/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBAction func didPressSignup(_ sender: UIButton) {
        performSegue(withIdentifier: "signupToHome", sender: UIButton.self)
    }
    @IBAction func didPressLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "signupToLogin", sender: UIButton.self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
