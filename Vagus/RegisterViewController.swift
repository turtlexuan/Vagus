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

    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    
    public var userEmail : NSString!
    var SUVC = SignUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.emailTextField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueAction(_ sender: Any) {
        
        SUVC.userEmail = self.emailTextField.text! as NSString!
        
//        let SUVC = SignUpViewController()
//        self.present(SUVC, animated: true, completion: nil)
        
    }

    @IBAction func cancelAction(_ sender: Any) {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
