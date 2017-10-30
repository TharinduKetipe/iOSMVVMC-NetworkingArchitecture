//
//  User.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/18/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class User: APIModel {
    var userId: NSInteger?
    var name: String?
    var username: String?
    var email: String?
    var phone: String?
    var website: String?
    var address: Address?
    var company: Company?

    override func mapping(map: Map) {
        userId <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        phone <- map["phone"]
        website <- map["website"]
        address <- map["address"]
        company <- map["company"]
    }
}
