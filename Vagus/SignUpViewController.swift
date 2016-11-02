//
//  SignUpViewController.swift
//  Vagus
//
//  Created by 楊信之 on 01/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var postTextField: UITextField!
    @IBOutlet weak var hobbyTextfield: UITextField!
    @IBOutlet weak var specialityTextField: UITextField!

    
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
        }
        let takePhotoAction = UIAlertAction(title: "Take A Photo", style: .default) { (action) in
            // ...
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(takePhotoAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)

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
