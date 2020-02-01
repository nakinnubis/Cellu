//
//  RestfulApi.swift
//  Reharsal
//
//  Created by Akinnubi Abiola on 1/28/20.
//  Copyright © 2020 Leadway.com. All rights reserved.
//

import Foundation
import Alamofire

struct SetBaseUrl{
    let baseUrl : String = "https://reqres.in/api/users"
    func getBaseUrl() -> String {
        return baseUrl
    }
}

struct RestfulApi {
    let authorizationHeader : HTTPHeaders = [
        "Accept": "application/json"
    ]
    let baseUrl = SetBaseUrl()
    var parameters = [String: Any]()
    var endpoint = ""
    
    func postRequest(completion: @escaping (Any?, String?)-> Void) {
        Alamofire.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: authorizationHeader).validate().responseJSON { response in
            switch response.result {
            case .success:
                completion(response.value,nil)
                break
            case .failure(let error):
                completion(nil,error.localizedDescription)
            }
        }
    }
    func getRequestWithoutParamters(completion: @escaping (Any?, String?)-> Void) {
        Alamofire.request(endpoint, method: .get, encoding: JSONEncoding.default, headers: authorizationHeader).validate().responseJSON { response in
            switch response.result {
            case .success:
                completion(response.value,nil)
                break
            case .failure(let error):
                completion(nil,error.localizedDescription)
            }
        }
    }
    func getRequest(completion: @escaping (Any?, String?)-> Void){
        Alamofire.request(endpoint, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: authorizationHeader).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                completion(response.value,nil)
                break
            case .failure(let error):
                completion(nil,error.localizedDescription)
            }
        }
    }
    
  
//    (completion: @escaping ([Advert]?, String?)-> Void)  {
//           Alamofire.request(endpoint, method: .get, encoding: JSONEncoding.default, headers: authorizationHeader).responseAdvertisement { response in
//                     if let advertisement = response.result.value {
//                        completion(advertisement.adverts,nil)
//                     }
//                 }
//    }
    
}
