//
//  Post.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/25/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class Post: APIModel {
    var userId: NSInteger?
    var postId: NSInteger?
    var title: String?
    var body: String?

    override func mapping(map: Map) {
        userId <- map["userId"]
        postId <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}
