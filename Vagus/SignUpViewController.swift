//
//  SignUpViewController.swift
//  Vagus
//
//  Created by 楊信之 on 01/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import MobileCoreServices
import Photos

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImage         : UIImageView!
    @IBOutlet weak var IDTextField          : UITextField!
    @IBOutlet weak var ageTextField         : UITextField!
    @IBOutlet weak var postTextField        : UITextField!
    @IBOutlet weak var hobbyTextfield       : UITextField!
    @IBOutlet weak var specialityTextField  : UITextField!
    
    public var userEmail : NSString!
    

    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextVC(_ sender: Any) {
        
    }

    func imageTapped(img: AnyObject) {
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        if self.imagePicker.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
        }
        
        profileImage.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
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
