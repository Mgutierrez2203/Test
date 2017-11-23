//
//  DataFakes.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation
import ObjectMapper

struct DataFakes {
    static var user = User.init(email: "fakeUser@directo.com", password: "123", token: "TokenFake")
}

struct DataFakesDTO {
    static var user = UserDTO.init(email: "fakeUser@directo.com", password: "123", token: "tokenFake")
}
