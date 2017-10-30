//
//  PostViewModel.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/26/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import Foundation

protocol PostViewModelDelegate: class  {

}

struct PostViewModel {
    var delegate: PostViewModelDelegate?
    weak var veiwController: PostViewController!
    
    var userId: String!
    var postId: String!
    var title: String!
    var body: String!

    init(post: Post) {
        self.userId = String(describing: post.userId!)
        self.postId = String(describing: post.postId!)
        self.title = post.title!
        self.body = post.body!
    }

}

