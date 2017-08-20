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

        let urlstr = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        tokenRequest(HTTPrequest: .GET, URLSting: urlstr, parameters: nil) { (json, issuccess) in
            
            
            
            
            
            //隔离数据
            let result = json?["statuses"] as? [[String: AnyObject]]
            
            
            completion(result, issuccess)
    
        }



    }
}
