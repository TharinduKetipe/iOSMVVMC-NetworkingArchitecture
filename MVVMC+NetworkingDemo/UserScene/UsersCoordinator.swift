//
//  UsersCoordinator.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

protocol UsersCoordinatorDelegate: HandleSegueDelegate {

}

class UsersCoordinator: Coordinator {

    var window: UIWindow
    weak var delegate: UsersCoordinatorDelegate?

    var  selectedUser: User?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let storyboard = UIStoryboard(name: "Users", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "list") as? UsersListController {
            let uDs = UserDataService(pClient:APIClient())
            uDs.getUserDetails { (response, status) in
                if (status == APIClient.APIResponseStatus.Success) {
                    if let resArrray = response as? [User] {
                        var viewModel = UsersListViewModel.init(userList: resArrray)
                        viewModel.delegate = self as UsersListViewModelDelegate
                        viewModel.veiwController = vc
                        vc.viewModel = viewModel
                        vc.coordinationDelegate = self as CoordinationDelegate
                        let nav = UINavigationController.init(rootViewController: vc)
                        self.window.rootViewController = nav
                    }
                }
            }
        }
    }

    func presentRandomCity() {
        let storyboard = UIStoryboard(name: "Users", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "detail") as? UserDetailViewController ,
            let nav = window.rootViewController {
        }
    }
}

extension UsersCoordinator: HandleSegueDelegate {
    
    func handleSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showUsersList" {
            let vc = segue.destination as! UsersListController
            let uDs = UserDataService(pClient:APIClient())
            uDs.getUserDetails { (response, status) in
                if (status == APIClient.APIResponseStatus.Success) {
                    if let resArrray = response as? [User] {
                        var viewModel = UsersListViewModel.init(userList:resArrray)
                        viewModel.veiwController = vc
                        viewModel.delegate = self as UsersListViewModelDelegate
                        vc.coordinationDelegate = self as CoordinationDelegate
                        vc.viewModel = viewModel
                        vc.tableView.reloadData()
                    }
                } else {
                    //error alert
                }
            }
        }
    }

    func handleSegueWithPost(segue: UIStoryboardSegue, post: Post) {

    }

}

extension UsersCoordinator: CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showDetail" {
            let dest = segue.destination as! UserDetailViewController
            var viewModel = UserDetailViewModel.init(user: selectedUser!)
            dest.viewModel = viewModel
            viewModel.delegate = self as? UserDetailViewModelDelegate
            dest.coodinationDelegate = self

        }
    }
}

extension UsersCoordinator: UsersListViewModelDelegate {
    func selectUser(viewController: UIViewController, user: User) {
        selectedUser = user
        viewController.performSegue(withIdentifier: "showDetail", sender: viewController)
    }
}

extension UsersListController: UserDetailViewModelDelegate {
    
}
