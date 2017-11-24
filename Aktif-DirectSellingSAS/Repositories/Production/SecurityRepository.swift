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
    
    func loginUser(_ user: UserDTO, completionHandler: @escaping (_ json: [String:AnyObject]?, _ error: NSError?) -> Void) {
        
        let url = URLsOperationServices.login.description + "?email=" + user.email! + "&password=" + user.password!
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response: DataResponse<Any>) in
            
            let jsonString = response.result.value as? [String:AnyObject]
            switch response.result {
            case .success(_):
                completionHandler(jsonString, nil)
            case .failure(let alamoFireError):
                if (response.response != nil && response.response?.statusCode != 0) {
                    let mensaje = NSError(domain: "usuario o contraseña incorrectos", code: response.response!.statusCode, userInfo: [NSLocalizedDescriptionKey: "usuario o contraseña incorrectos"])
                    completionHandler(nil, mensaje)
                } else {
                    completionHandler(nil, alamoFireError as NSError)
                }
            }
        }
    }
}
