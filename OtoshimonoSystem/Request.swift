//
//  Request.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import Foundation
import Alamofire

struct Request {
    
    let url: String
    let method: HTTPMethod
    let parameters: Parameters
    
    init(path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
        url = path
        self.method = method
        self.parameters = parameters
    }
    
    func request(success: @escaping (_ data: Any)-> Void, fail: @escaping (_ error: Error?)-> Void) {
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                success(response.result.value as Any)
            }else{
                fail(response.result.error)
            }
        }
    }
    
}
