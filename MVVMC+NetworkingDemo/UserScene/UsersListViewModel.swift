//
//  CityListViewModel.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit
import Foundation

protocol UsersListViewModelDelegate: class  {
    func selectUser(viewController: UIViewController, user: User)
}

struct UsersListViewModel {
    var delegate: UsersListViewModelDelegate?
    weak var veiwController: UsersListController!
    var names = [String]()
    var users = [User]()

    init(userList: [User]) {
        users = userList
        for user in users {
            if let name = user.name {
                names.append(name)
            }
        }
    }

    func selectRow(row: NSInteger) {
        delegate?.selectUser(viewController: veiwController, user: users[row])
    }

}
