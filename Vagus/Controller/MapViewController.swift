//
//  MapViewController.swift
//  Vagus
//
//  Created by 楊信之 on 04/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let locationMG = LocationManager.sharedInstance
        locationMG.requestAlwaysInUse()
        locationMG.start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action(_ sender: Any) {
        
        let locationMG = LocationManager.sharedInstance
        
    }

    

}
