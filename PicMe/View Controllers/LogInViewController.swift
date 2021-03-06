//
//  LogInViewController.swift
//  PicMe
//
//  Created by Pann Cherry on 9/26/18.
//  Copyright © 2018 Pann Cherry. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.font = UIFont(name: "Pacifico", size: 60)
        label2.font = UIFont(name: "Pacifico", size: 20)
    }
    
  
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userNameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user == nil {
                print("Username/email is required.")
                self.loginErrorAlert()
            }
            if user != nil {
                print("You are logged in.")
                self.userNameField.text = ""
                self.passwordField.text = ""
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            }
            
        }
    }
    
    func loginErrorAlert(){
        let alert = UIAlertController(title: "Login Error", message: "Hmm..something went wrong. or Username/Email is missing.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        userNameField.text = ""
        passwordField.text = ""
    }
    
  
    @IBAction func onTapDismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }

}
