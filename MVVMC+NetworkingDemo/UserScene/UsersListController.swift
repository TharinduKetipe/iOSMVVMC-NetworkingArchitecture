//
//  UsersListController.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/29/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

class UsersListController: UITableViewController, Coordinated {
    var coordinationDelegate: CoordinationDelegate?
    var viewModel: UsersListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension UsersListController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.names.count
        }
        return 0;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "ItemCell")
        }
        cell!.textLabel?.text = viewModel?.names[indexPath.row]
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectRow(row: indexPath.row)
    }

}
