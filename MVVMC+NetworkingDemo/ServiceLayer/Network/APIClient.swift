//
//  APIClient.swift
//  MediumMVVMCTest
//
//  Created by Tharindu Ketipearachchi on 10/12/17.
//  Copyright © 2017 Eyepax. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftyJSON

class APIClient: NSObject {

    enum APIResponseStatus : Int {
        case Success = 200
        case ValidationError = 422
        case Error = 212
        case CommonError = 213
        case BadRequest = 400
        case UnAuthorized = 403
        case NotFound = 404
        case InternalServerError = 500
        case Other
    }

    private let apiKey = ""

    override init() {

    }

    func getHTTPHeaders() -> HTTPHeaders? {
        return ["Content-Type" : "application/json"];
    }
}

extension APIClient {

    func GETArray<T:BaseMappable>(url:URL, params:[String : Any?], completion:@escaping ([Any] , APIResponseStatus) -> Void) -> T? {

        let request = Alamofire.request(url,
                                        method: .get,
                                        parameters: params,
                                        encoding: JSONEncoding.default,
                                        headers: self.getHTTPHeaders())

        request.response { (response) in

            do {
                let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [Any]
                let apiResponse = Mapper<T>().mapArray(JSONObject: json)

                if let status = response.response?.statusCode {
                    if let resonseData = apiResponse {
                        completion (resonseData as! [Any] , APIClient.APIResponseStatus(rawValue: status)!)
                    } else {
                        completion ([] , APIClient.APIResponseStatus(rawValue: status)!)
                    }

                } else  {
                    if let resonseData = apiResponse {
                        completion (resonseData as! [Any] ,  APIClient.APIResponseStatus.Other)
                    } else {
                        completion ([] ,  APIClient.APIResponseStatus.Other)
                    }
                }
            } catch {

            }
        }
        return nil
    }

    func GETObject<T:BaseMappable>(url:URL, params:[String : Any?], completion:@escaping (Any? , APIClient.APIResponseStatus) -> Void) -> T? {
        
        let request = Alamofire.request(url,
                                        method: .get,
                                        parameters: params,
                                        encoding: JSONEncoding.default,
                                        headers: self.getHTTPHeaders())

        request.responseObject { (response: DataResponse<T>) in
            if let status = response.response?.statusCode {
                if let responseData = response.result.value {
                    completion(responseData , APIClient.APIResponseStatus(rawValue: status)!)
                } else {
                    completion(nil , APIClient.APIResponseStatus(rawValue: status)!)
                }
            } else {
                if let responseData = response.result.value {
                    completion(responseData , APIClient.APIResponseStatus.Other)
                } else {
                    completion(nil , APIClient.APIResponseStatus.Other)
                }
            }
        }

        return nil
    }


}

