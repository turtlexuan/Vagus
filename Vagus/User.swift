//
//  User.swift
//  Vagus
//
//  Created by 楊信之 on 03/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class User: NSObject {

    let age : Int
    let id : Int
    let post : String
    let hobby : String
    let speciality : String
    
    init(_age : Int, _id : Int, _post : String, _hobby : String, _speciality : String) {
        age = _age
        id = _id
        post = _post
        hobby = _hobby
        speciality = _speciality
    }
}
