//
//  WBNetworkMenage+Extensions.swift
//  iOS微博
//
//  Created by pirders on 2017/8/18.
//  Copyright © 2017年 pirders. All rights reserved.
//

import Foundation


// MARK: - 封装微博的网络请求
extension WBNetworkMenage {

    
    
    func statusList(completion: @escaping (_ List: [[String: AnyObject]]?,_ isSuccess: Bool)->()) {
        //func statusList(completion: ()->()) {

        let urlstr = "https://api.weibo.com/2/statuses/home_timeline.json"
        let parsm = ["access_token": "2.00ieZlUGFJN6sB5fa251acd6WZhpsB"]
        
        request(HTTPrequest: .GET, URLSting: urlstr, parameters: parsm as [String : AnyObject]) { (json, issuccess) in
            
            
          //  print(json)
            let result = json?["statuses"] as? [[String: AnyObject]]
          //  let result = json["statuses"] as? [[String: AnyObject]]
            completion(result, issuccess)
    
        }



    }
}
