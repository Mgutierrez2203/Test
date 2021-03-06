//
//  User.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright (c) 2017 Mateo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// NOTE: Domain Model

class User: Equatable
{
    var email: String?
    var password: String?
    var token: String?
    
    
    init(){}
    
    init(email: String?, password: String?, token: String?) {
        self.email = email
        self.password = password
        self.token = nil
    }
    
    public static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email &&
            lhs.password == rhs.password &&
            lhs.token == rhs.token
    }
}
