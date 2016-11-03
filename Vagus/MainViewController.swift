//
//  MainViewController.swift
//  Vagus
//
//  Created by Mac on 11/4/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var userProfileImage     : UIImageView!
    @IBOutlet weak var userID               : UILabel!
    @IBOutlet weak var userAge              : UILabel!
    @IBOutlet weak var userHobby            : UILabel!
    @IBOutlet weak var userSpeciality       : UILabel!
    @IBOutlet weak var userLevel            : UILabel!
    @IBOutlet weak var levelImage           : UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    @IBAction func goChatAction(_ sender: Any) {
    }

    
    @IBAction func nextVC(_ sender: Any) {
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
