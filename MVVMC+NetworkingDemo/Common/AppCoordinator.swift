//
//  AppCoordinator.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 9/28/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit

class AppCoordinator : Coordinator {

    fileprivate let kHomeCoordinator: String = "kHomeCoordinator"
    fileprivate let kUsersCoordinator: String = "kUsersCoordinator"
    fileprivate let kPostCoordinator: String = "kPostCoordinator"

    var window: UIWindow
    var coordinators = [String: Coordinator]()

    init(window: UIWindow) {
        self.window = window
        UIViewController.addCoordination()
        
    }

    func start() {
        goToHome()
    }

    func goToHome() {
        let homeCoordinator = HomeCoordinator(window: window)
        coordinators[kHomeCoordinator] = homeCoordinator
        homeCoordinator.delegate = self as HomeCoordinatorDelegate
        homeCoordinator.start()
    }
}

extension AppCoordinator: HandleSegueDelegate {
    
    func handleSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showUsersList" {
            let usersCoordinator = UsersCoordinator(window: window)
            coordinators[kUsersCoordinator] = usersCoordinator
            usersCoordinator.delegate = self as UsersCoordinatorDelegate
            usersCoordinator.handleSegue(segue: segue)
        }
    }

    func handleSegueWithPost(segue: UIStoryboardSegue, post: Post) {
        if segue.identifier == "showPost" {
            let postCoordinator = PostCoordinator(window: window)
            coordinators[kPostCoordinator] = postCoordinator
            postCoordinator.delegate = self as PostCoordinatorDelegate
            postCoordinator.handleSegueWithPost(segue: segue, post: post)
        }
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func goToRandomCity() {
        let usersCoordinator = UsersCoordinator(window: window)
        coordinators[kUsersCoordinator] = usersCoordinator
        usersCoordinator.delegate = self as UsersCoordinatorDelegate
        usersCoordinator.presentRandomCity()
    }
}

extension AppCoordinator: UsersCoordinatorDelegate {
    
}

extension AppCoordinator: PostCoordinatorDelegate {
    
}

extension UIViewController {
    class func addCoordination() {
        DispatchQueue.once(token: "com.mvvmcs.test1") {
                 let originalPerformSelector = #selector(UIViewController.prepare(for:sender:))
            let swizzledPerformSelector = #selector(swizzledPrepare(for:sender:))

            method_exchangeImplementations(class_getInstanceMethod(UIViewController.self, originalPerformSelector)!,
                                           class_getInstanceMethod(UIViewController.self, swizzledPerformSelector)!)
        }
    }

    @objc func swizzledPrepare(for segue: UIStoryboardSegue, sender: Any?) {
        defer {
            self.swizzledPrepare(for: segue, sender: self)
        }

        guard let sourceViewController = segue.source as? Coordinated else {
            return
        }

        sourceViewController.coordinationDelegate?.prepareForSegue(segue: segue)
    }
}


public extension DispatchQueue {

    private static var _onceTracker = [String]()


    public class func once(token: String, block:()->Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }

        if _onceTracker.contains(token) {
            return
        }

        _onceTracker.append(token)
        block()
    }
}
