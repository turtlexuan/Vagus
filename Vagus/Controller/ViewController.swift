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

    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - IBAction
    @IBAction func loginAction(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:  { (user, error) in
            
            if (error != nil) {
                // Show Error Alert
                
                print("Incorrect")
                
            } else {
                // Go to Main Page.
                DispatchQueue.global().async {
                    
                    DispatchQueue.main.async {
                        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                        self.navigationController?.pushViewController(mainVC, animated: true)
                    }
                }
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

