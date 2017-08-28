//
//  WBNetworkMenage+Extensions.swift
//  iOS微博
//
//  Created by pirders on 2017/8/18.
//  Copyright © 2017年 pirders. All rights reserved. 
//

import Foundation



// MARK: -  - 封装微博的网络请求
extension WBNetworkMenage {

    
    
    func statusList(since_id: Int64 = 0 ,max_id: Int64 = 0 ,completion: @escaping (_ List: [[String: AnyObject]]?,_ isSuccess: Bool)->()) {

        let urlstr = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        let parameter = ["since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? max_id - 1 : 0 )"]
        tokenRequest(HTTPrequest: .GET, URLSting: urlstr, parameters: parameter as [String : AnyObject]) { (json, issuccess) in
            
            //隔离数据
            let result = json?["statuses"] as? [[String: AnyObject]]
            
            
            completion(result, issuccess)
    
        }



    }
}
