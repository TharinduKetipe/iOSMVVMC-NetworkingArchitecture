//
//  UserDetailViewModel.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import Foundation

protocol UserDetailViewModelDelegate : class {

}

struct UserDetailViewModel {
    weak var delegate: UserDetailViewModelDelegate?
    var name: String!
    var username: String!
    var email: String!
    var phone: String!
    var website: String!

    init(user: User) {
        self.name = user.name
        self.username = user.username
        self.email = user.email
        self.phone = user.phone
        self.website = user.website
    }


}
