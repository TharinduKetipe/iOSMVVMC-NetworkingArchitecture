//
//  HomeViewController.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , Coordinated {

    @IBOutlet var btnUserList: UIButton!
    @IBOutlet var btnRandomCity: UIButton!

    var viewModel: HomeViewModel?
    var coordinationDelegate: CoordinationDelegate?

    override func viewDidLoad() {

        super.viewDidLoad()
    }


    @IBAction func didTapUsersList(_ sender: Any) {
        viewModel?.didSelectGoToUsersList()
    }

    @IBAction func didTapGoToPost(_ sender: Any) {
        let uDs = UserDataService(pClient:APIClient())
        uDs.getPostItem(postId: "1", completion: { (response, status) in
            if (status == APIClient.APIResponseStatus.Success) {
                if response != nil {
                    self.viewModel?.didSelectGoToPost(post: response!)
                } else {
                    //error alert
                }

            }
        })

    }

}
