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
    
    static func convertToUserDTO (user: User) -> UserDTO {
        let userDTO = UserDTO.init(email: user.email, password: user.password, token: nil)
        return userDTO
    }
    
    static func convertProspectusDTOToProspectus (prospectsDTO: Array<ProspectusDTO>) -> Array <Prospectus> {
        var prospects = Array<Prospectus>()
        for prospectDTO in prospectDTO {
            let prospectus = Prospectus.init(name: prospectDTO.name, lastName: prospectDTO.lastName, identification: prospectDTO.identification, phone: prospectDTO.phone, statusCode: prospectDTO.statusCode)
            noticias.append(noticia)
        }
        return noticias
    }
}

















