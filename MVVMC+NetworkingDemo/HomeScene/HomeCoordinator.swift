//
//  HomeCoordinator.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

protocol HomeCoordinatorDelegate: HandleSegueDelegate {
    func goToRandomCity()
}

class HomeCoordinator: Coordinator {

    var window: UIWindow
    var post: Post?
    weak var delegate: HomeCoordinatorDelegate?

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Home", bundle:nil)

        if let nav = storyboard.instantiateInitialViewController() as? UINavigationController {
            let vc = nav.viewControllers.first as! HomeViewController
            var viewModel =  HomeViewModel()
            viewModel.delegate = self
            viewModel.viewController = vc
            vc.viewModel = viewModel
            vc.coordinationDelegate = self
            window.rootViewController = nav
        }
    }
}

extension HomeCoordinator: CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showUsersList" {
            delegate?.handleSegue(segue: segue)
//            Either you can go with this as well
//            let userCoordinator = UsersCoordinator(window: self.window)
//            userCoordinator.start()
        }

        if segue.identifier == "showPost" {
            if self.post != nil {
                 delegate?.handleSegueWithPost(segue: segue, post: self.post!)
            }
        }
    }
}

extension HomeCoordinator: HomeViewModelDelegate {
 
    func homeViewModelDidSelectGoToUsersList(viewController: UIViewController) {
        viewController.performSegue(withIdentifier: "showUsersList", sender: viewController)
    }

    func homeViewModelDidSelectGoToPost(viewController: UIViewController, post: Post) {
        self.post = post
        viewController.performSegue(withIdentifier: "showPost", sender: viewController)
    }
}
