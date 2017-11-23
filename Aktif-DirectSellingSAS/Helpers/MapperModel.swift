//
//  MapperModel.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 22/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation
import ObjectMapper

class MapperModel {
    
    static func convertToUserDTO(user: User) -> UserDTO {
        let userDTO = UserDTO.init(email: user.email, password: user.password, token: nil)
        return userDTO
    }
}

















