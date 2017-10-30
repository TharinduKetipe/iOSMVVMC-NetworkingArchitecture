//
//  UserDataService.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/18/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit
import Alamofire

class UserDataService: NSObject {

    fileprivate var client = APIClient()

    private override init() {

    }
    init(pClient : APIClient) {
        self.client = pClient
    }

}

extension UserDataService {

    //get array of objects
    func getUserDetails(completion:@escaping ([Any] , APIClient.APIResponseStatus) -> Void){

        let url = URL(string: Constants.basUrl + APIRequestMetod.userDetails)
        let result:User? = self.client.GETArray(url: url!, params: [:]) { (response, status) in
            completion(response , status)
        }
    }

    //get one object
    func getPostItem(postId:String, completion:@escaping (Post? , APIClient.APIResponseStatus) -> Void){

        let url = URL(string: Constants.basUrl + APIRequestMetod.postItem + "/" + postId)

        let result:Post? = self.client.GETObject(url: url!, params: [:]) { (response, status) in
            if let post = response as? Post {
                completion(response as! Post, status)
            } else {
                completion(nil, status)
            }

        }

    }
}
