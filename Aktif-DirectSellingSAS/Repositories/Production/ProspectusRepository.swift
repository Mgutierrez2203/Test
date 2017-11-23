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
        
        Alamofire.request(URLsOperationServices.getNoticias.description, method: HTTPMethod.get, encoding: JSONEncoding.default, headers:token).validate().responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(let valueJson):
                if let jsonDictionary = valueJson as? [NSDictionary] {
                    let noticiasDTO = Mapper<NoticiaDTO>().mapArray(JSONObject: jsonDictionary)
                    completionHandler(noticiasDTO, nil)
                }
            case .failure(let error):
                NSLog("Error NoticiasRepository.getNoticias\([error.localizedDescription])")
                completionHandler(nil, self.getAlamofireError(error: error))
                break
            }
        }
    }
}
}