//
//  Data.swift
//  Cellulant
//
//  Created by Oluwafemi Faseyitan on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import Foundation
import Alamofire
struct Datas : Codable {
    let id : Int?
    let email : String?
    let first_name : String?
    let last_name : String?
    let avatar : String?
}



struct UserData: Codable {
    var datas: [Datas]?
    var page : Int?
       var per_page : Int?
       var total : Int?
       var total_pages : Int?
}








