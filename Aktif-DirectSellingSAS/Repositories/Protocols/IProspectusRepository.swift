//
//  IProspectusRepository.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 22/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation

protocol IProspectusRepository
{
    func getProspectsLists(_ token: String, completionHandler:@escaping (_ prospects : [ProspectusDTO]?, _ error: NSError?) -> Void)
}
