//
//  ISecurityRepository.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation

protocol ISecurityRepository
{
    func loginUser(_ user: User, completionHandler: @escaping (_ json : String?, _ error: NSError?) -> Void)
}
