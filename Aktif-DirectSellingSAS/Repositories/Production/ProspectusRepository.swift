//
//  ProspectusRepository.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 22/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

private let sharedInstance = ProspectusRepository()

class ProspectusRepository : IProspectusRepository {
    
    static let sharedInstance = ProspectusRepository()
    
    class var sharedDispatchInstance: ProspectusRepository {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: ProspectusRepository? = nil
        }
        
        // DispatchQueue.once(token: Static.onceToken)
        DispatchQueue.main.async {
            Static.instance = ProspectusRepository()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: ProspectusRepository {
        struct Static {
            static let instance = ProspectusRepository()
        }
        return Static.instance
    }
    
    func getProspectsLists(_ token: String, completionHandler: @escaping ([ProspectusDTO]?, NSError?) -> Void) {
        let url = URLsOperationServices.getProspectus.description
        
        let headers: [String: String] = ["authToken": token]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response: DataResponse<Any>) in
            switch(response.result) {
            case .success(let valueJson):
                if let jsonDictionary = valueJson as? [NSDictionary] {
                    let prospectsDTO = Mapper<ProspectusDTO>().mapArray(JSONObject: jsonDictionary)
                    completionHandler(prospectsDTO, nil)
                }
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

