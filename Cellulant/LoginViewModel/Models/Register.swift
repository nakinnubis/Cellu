//
//  Register.swift
//  Cellulant
//
//  Created by Oluwafemi Faseyitan on 2/1/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import Foundation

struct Register {
    var email: String?
    var password: String?
    var deviceid: String?
    init(email: String?, password: String?, deviceid: String) {
        self.email = email
        self.password = password
        self.deviceid = deviceid
    }
}
