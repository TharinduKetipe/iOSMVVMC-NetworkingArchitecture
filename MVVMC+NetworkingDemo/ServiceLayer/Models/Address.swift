//
//  Address.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/18/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class Address: APIModel {

    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?

    override func mapping(map: Map) {
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
    }

}
