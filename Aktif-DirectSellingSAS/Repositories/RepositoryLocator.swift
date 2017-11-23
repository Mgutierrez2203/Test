//
//  RepositoryLocator.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Dispatch
import Foundation

private let sharedInstance = RepositoryLocator()

public class RepositoryLocator {
    
    static let sharedInstance = RepositoryLocator()
    //var use_test_repository: Bool
    
    class var sharedDispatchInstance: RepositoryLocator {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: RepositoryLocator? = nil
        }
        //DispatchQueue.once(token: Static.onceToken)
        DispatchQueue.main.async {
            Static.instance = RepositoryLocator()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: RepositoryLocator {
        struct Static {
            static let instance = RepositoryLocator()
        }
        return Static.instance
    }
    
    init() {
       //use_test_repository = false
    }
    
    func securityRepository() -> ISecurityRepository {
        //if (use_test_repository) {
        //    return SecurityRepositoryTest.sharedInstance
        //} else {
            return SecurityRepository.sharedInstance
        //}
    }
    
    func prospectusRepository() -> IProspectusRepository {
        return ProspectusRepository.sharedInstance
    }
    
}
