//
//  HomeViewModel.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate: class {
    func homeViewModelDidSelectGoToUsersList(viewController: UIViewController)
    func homeViewModelDidSelectGoToPost(viewController: UIViewController, post:Post)
}

struct HomeViewModel {

    weak var delegate: HomeViewModelDelegate?
    weak var viewController: HomeViewController?

    func didSelectGoToUsersList() {
        delegate?.homeViewModelDidSelectGoToUsersList(viewController: self.viewController!)
    }

    func didSelectGoToPost(post: Post) {
        delegate?.homeViewModelDidSelectGoToPost(viewController: self.viewController!, post: post)
    }
    
}
