//
//  Enumerators.swift
//  Aktif-DirectSellingSAS
//
//  Created by Esteban Caro on 22/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation

enum URLsOperationServices : CustomStringConvertible {
    case login, getProspectus, editProspectus
    var description: String {
        switch self {
        case .login:
            return "\(URL_BASE)application/login"
        case .getProspectus:
            return "\(URL_BASE)sch/prospects.json"
        case .editProspectus:
            return "\(URL_BASE)"
        }
    }
}
