//
//  PostCoordinator.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/26/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

protocol PostCoordinatorDelegate: HandleSegueDelegate {

}

class PostCoordinator: Coordinator {

    var window: UIWindow
    var post: Post?
    weak var delegate: PostCoordinatorDelegate?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {

    }
}

extension PostCoordinator: HandleSegueDelegate {
    func handleSegue(segue: UIStoryboardSegue) {

}

    func handleSegueWithPost(segue: UIStoryboardSegue, post: Post) {

        if segue.identifier == "showPost" {
            var viewModel = PostViewModel.init(post: post)
            let vc = segue.destination as! PostViewController
            viewModel.veiwController = vc
            viewModel.delegate = self as? PostViewModelDelegate
            vc.coordinationDelegate = self as? CoordinationDelegate
            vc.viewModel = viewModel
        }
        
    }
}
