//
//  SecurityRepositoryTest.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation

private let sharedInstance = SecurityRepositoryTest()

class SecurityRepositoryTest //:ISecurityRepository
{
    static let sharedInstance = SecurityRepositoryTest()
    
    class var sharedDispatchInstance: SecurityRepositoryTest {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: SecurityRepositoryTest? = nil
        }
        
        // DispatchQueue.once(token: Static.onceToken)
        DispatchQueue.main.async {
            Static.instance = SecurityRepositoryTest()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: SecurityRepositoryTest {
        struct Static {
            static let instance = SecurityRepositoryTest()
        }
        return Static.instance
    }
    
    func loginUser(_ user: UserDTO, completionHandler: @escaping (_ json: String?, _ error: NSError?) -> Void) {
        completionHandler("nil", nil)
        // completionHandler(DataFakes.user , nil)
    }
}
