//
//  Company.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/18/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class Company: APIModel {

    var companyName: String?
    var phrase: String?
    var bs: String?

    override func mapping(map: Map) {
        companyName <- map["name"]
        phrase <- map["catchPhrase"]
        bs <- map["bs"]
    }
}
