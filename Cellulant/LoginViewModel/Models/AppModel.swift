//
//  AppModel.swift
//  Cellulant
//
//  Created by Akinnubi Abiola on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import Foundation

class UserLogin {
     static let sharedInstance = UserLogin()
    var userinfo = User(email: nil, password: nil, deviceid: nil)
    var allUserData = UserData(datas: nil, page: nil, per_page: nil, total: nil, total_pages: nil)
    var selecteduser = Datas(id: nil, email: nil, first_name: nil, last_name: nil, avatar: nil)
}
struct User : Codable {
    var email: String?
    var password: String?
    var deviceid: String?
}
