//
//  ViewController.swift
//  Vagus
//
//  Created by 楊信之 on 01/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        FIRAuth.auth()?.createUser(withEmail: "rc840327@gmail.com", password: "A1ed4531drg", completion: { (user, error) in
//            //
//            print(">>>")
//            if error != nil {
//                print(error)
//                return
//            }
//            print("!!!!!!!")
//            print(user)
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpAction(_ sender: Any) {
        
        
        
    }

    @IBAction func loginAction(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:  { (user, error) in
            
            if (error != nil) {
                // Show Error Alert
                
                print("Incorrect")
                
            } else {
                // Go to Main Page.
                print("!!")
            }
        })
        
    }
    
    @IBAction func facebookSignUp(_ sender: Any) {
    }
    
    @IBAction func googleSignUp(_ sender: Any) {
    }

    @IBAction func twitterSignUp(_ sender: Any) {
    }
}

