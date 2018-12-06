//
//  LoginViewController.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/7/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userEmail = ""
    var userPassword = ""
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }

        if emailText == "" || passwordText == "" {
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields
            let alertController = UIAlertController(title: "Log In Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            // email and password fields are not blank, let's try logging in the user! you'll need to use `emailText` and `passwordText`, and a method found in this api doc https://firebase.google.com/docs/auth/ios/start

            // if the error == nil, segue to the main page using `performSegue` with identifier
            // `logInToMainPage`
            Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
                // if there is an error signing in (error != nil), present the following alert:
                if error != nil {
                    let alertController = UIAlertController(title: "Log In Error", message:
                        error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "loginToHome", sender: UIButton.self)
                }
            }
        }
        
        // FOR TESTING PURPOSES, COMMENT OUT WHEN DEMOING
//        self.performSegue(withIdentifier: "loginToHome", sender: UIButton.self)
    }
    @IBAction func didPressSignup(_ sender: UIButton) {
        performSegue(withIdentifier: "loginToSignup", sender: UIButton.self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)

    }
    override func viewDidAppear(_ animated: Bool) {
        let user = Auth.auth().currentUser;
        if (user != nil) {
            // User is signed in.
            sleep(1)
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailTextField {
            if textField.text != nil {
                self.userEmail = textField.text!
            }
        } else {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        }
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
