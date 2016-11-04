//
//  UserHangler.swift
//  Vagus
//
//  Created by 楊信之 on 03/11/2016.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class UserHangler: NSObject {

    var users : [User]
    
    override init() {
        users = []
        super.init()
    }
    
    
    // MARK: - Singleton
    class var sharedInstance: UserHangler {
        struct Static {
            static let instance: UserHangler = UserHangler()
        }
        return Static.instance
    }
    
    func addUser( user : User) {
        users.append(user)
    }
    
    func getUser() -> [User] {
        return users
    }
    
}
