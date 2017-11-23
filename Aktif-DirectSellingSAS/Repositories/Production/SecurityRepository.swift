//
//  SecurityRepository.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

private let sharedInstance = SecurityRepository()

class SecurityRepository : ISecurityRepository {
    
    static let sharedInstance = SecurityRepository()
    
    class var sharedDispatchInstance: SecurityRepository {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: SecurityRepository? = nil
        }
        
        // DispatchQueue.once(token: Static.onceToken)
        DispatchQueue.main.async {
            Static.instance = SecurityRepository()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: SecurityRepository {
        struct Static {
            static let instance = SecurityRepository()
        }
        return Static.instance
    }
    
    func loginUser(_ user: User, completionHandler: @escaping (_ json: String?, _ error: NSError?) -> Void) {
        let JSONUser = Mapper().toJSON(user)
        Alamofire.request(URLsOperationServices.login.description, method: HTTPMethod.get, parameters: JSONUser, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response: DataResponse<Any>) in
            
            let jsonString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
            switch response.result {
            case .success(_):
                completionHandler(jsonString as String?, nil)
            case .failure(let alamoFireError):
                if (response.response != nil && response.response?.statusCode != 0) {
                    let mensaje = NSError(domain: "error servicio", code: response.response!.statusCode, userInfo: [NSLocalizedDescriptionKey: "error servicio"])
                    completionHandler(nil, mensaje)
                } else {
                    completionHandler(nil, alamoFireError as NSError)
                }
            }
        }
    }
}
