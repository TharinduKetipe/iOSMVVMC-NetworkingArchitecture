//
//  CityDetailViewController.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    var coodinationDelegate: CoordinationDelegate?
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblUserName:UILabel!
    @IBOutlet weak var lblEmail:UILabel!
    @IBOutlet weak var lblPhone:UILabel!
    @IBOutlet weak var lblWebstie:UILabel!

    var viewModel: UserDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = viewModel?.name
        lblUserName.text = viewModel?.username
        lblEmail.text = viewModel?.email
        lblPhone.text = viewModel?.phone
        lblWebstie.text = viewModel?.website

        if (navigationController?.viewControllers.count)! == 1 {
            let closeButton = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(dismissFromParent))
            navigationItem.leftBarButtonItem = closeButton
        }
    }

    @objc func dismissFromParent() {
        self.dismiss(animated: true, completion: nil)
    }


}
