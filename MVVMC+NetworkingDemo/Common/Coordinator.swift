//
//  Coordinator.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

protocol Coordinator : class {
    func start()
}

protocol HandleSegueDelegate: class {
    func handleSegue(segue: UIStoryboardSegue)
    func handleSegueWithPost(segue: UIStoryboardSegue, post: Post)
}

protocol CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue)
}

protocol Coordinated {
    var coordinationDelegate: CoordinationDelegate? {get set}
}
