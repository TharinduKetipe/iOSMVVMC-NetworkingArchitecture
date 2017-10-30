//
//  PostViewController.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/26/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, Coordinated {

    var coordinationDelegate: CoordinationDelegate?
    var viewModel: PostViewModel?

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblBody:UILabel!
    @IBOutlet weak var lblUserId:UILabel!
    @IBOutlet weak var lblPostID:UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        lblTitle.text = viewModel?.title
        lblBody.text = viewModel?.body
        lblUserId.text = viewModel?.userId
        lblPostID.text = viewModel?.postId
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
