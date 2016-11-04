//
//  SignUpViewController.swift
//  Vagus
//
//  Created by 楊信之 on 01/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

import Photos
import Firebase

class SignUpViewController: UIViewController, UINavigationControllerDelegate {

    // MARK: - IBOutlet
    @IBOutlet weak var profileImage         : UIImageView!
    @IBOutlet weak var IDTextField          : UITextField!
    @IBOutlet weak var ageTextField         : UITextField!
    @IBOutlet weak var postTextField        : UITextField!
    @IBOutlet weak var hobbyTextfield       : UITextField!
    @IBOutlet weak var specialityTextField  : UITextField!

    // MARK: - Variable
    let imagePicker = UIImagePickerController()

    var email       : String = ""
    var password    : String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("!!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("@#")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated
        )
        
    }
    
    // MARK: - IBAction
    @IBAction func continueAction(_ sender: Any) {
        
        if self.email == "" && self.password == "" {
            print("no email and password")
            return
        }
        
        let userHandler = UserHangler.sharedInstance
        
        // TODO: - May be error
        let user = User(_age: Int(ageTextField.text!)! ,
                        _id: IDTextField.text!,
                        _post: postTextField.text!,
                        _hobby: hobbyTextfield.text!,
                        _speciality: specialityTextField.text!)
        userHandler.addUser(user: user)
        
        let auth = FIRAuth.auth()
        auth?.createUser(withEmail: self.email, password: self.password, completion: { (user, error) in
            //
            if error != nil {
                print("!!!!")
                print(error!)
                return
            }
            
            auth?.signIn(withEmail: self.email, password: self.password, completion: { (user, error) in
                            //
                if error != nil {
                    print(">>>>")
                    print(error!)
                    return
                }
            
                DispatchQueue.global().async {
                    
                    DispatchQueue.main.async {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            
            })
            
        })
    }
    

    
    @IBAction func tapAction(_ sender: Any) {
        print("haha")
        imageTapped()
    }
    
    // MARK: - Function
    func imageTapped() {
        let alertController = UIAlertController(title: "Upload Your Profile Image", message: nil, preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Upload From Photo Library", style: .default) { (action) in
            // ...
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType     = .photoLibrary
                self.imagePicker.delegate       = self
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let takePhotoAction = UIAlertAction(title: "Take A Photo", style: .default) { (action) in
            // ...
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType     = .camera
                self.imagePicker.delegate       = self
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(takePhotoAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)

    }
    
    
    
    

}

// MARK: - UIImagePickerControllerDelegate
extension SignUpViewController : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        if self.imagePicker.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
        }
        
        profileImage!.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
