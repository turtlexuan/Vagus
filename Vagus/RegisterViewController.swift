//
//  RegisterViewController.swift
//  Vagus
//
//  Created by Mac on 11/3/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.emailTextField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - IBAction
    @IBAction func continueAction(_ sender: Any) {
        
        let SUVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        guard let _email = self.emailTextField.text else {
            print("email is nil")
            return
        }
        
        guard let _password = self.passwordTextField.text else {
            print("password is nil")
            return
        }
        
        SUVC.email      = _email
        SUVC.password   = _password
        
        
        DispatchQueue.global().async {
            
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(SUVC, animated: true)
            }
        }
        
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        
        DispatchQueue.global().async {
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    
    }
    
    
    func signup() {
        
        FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            
            if error != nil {
                
//                self.login()
                
            } else {
                
                print( "User Created" )
                
//                self.login()
            }
            
        })

        
    }
    

}
