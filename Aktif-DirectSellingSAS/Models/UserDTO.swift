//
//  LoginDTO.swift
//  Aktif-DirectSellingSAS
//
//  Created by Esteban Caro on 21/11/17.
//  Copyright (c) 2017 Mateo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation
import ObjectMapper

// NOTE: DTO Model

class UserDTO : Mappable {
    var email: String?
    var password: String?
    var token: String?
    

    required init?(map: Map){
        
    }
    
    init(){}
    
    init(email: String!, password: String!, token: String!) {
        self.email = email
        self.password = password
        self.token = token
    }

    func mapping(map: Map) {
        AtributeOne <- map["atributeOne"]
        AtributeTwo <- map["atributeTwo"]
    }
}

