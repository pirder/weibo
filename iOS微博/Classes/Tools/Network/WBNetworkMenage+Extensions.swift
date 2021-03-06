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
    // 未读数据量
    func unreadCount(completion: @escaping (_ count: Int) -> ())  {
        
        guard let uid = userAccount.uid else {
            return
        }
        let urlString = "https://rm.api.weibo.com/2/remind/unread_count.json"
        
        let parameter = ["uid": uid]
        
        tokenRequest(HTTPrequest: .GET, URLSting: urlString, parameters: parameter as [String : AnyObject]) { (json, isSuccess) in
           
            let dict = json as? [String : AnyObject]
            let count = dict?["status"] as? Int
            completion(count ?? 0)
        
        }
    }
}

// MARK: - 获取用户头像
extension WBNetworkMenage {

    func loadUserInfo ( completion:  @escaping (_ dict: [String: AnyObject]) -> ())  {
        
        guard let uid = userAccount.uid else {
            return
        }
        let urlstring = "https://api.weibo.com/2/users/show.json"
        
        let params = ["uid": uid]
        
        tokenRequest(HTTPrequest: .GET, URLSting: urlstring, parameters: params as [String : AnyObject]) { (json, isSuccess) in
          
            //完成回调把json给dict
            completion((json as? [String : AnyObject]) ?? [:])
        }
    }


}




// MARK: - OAuth方法
extension WBNetworkMenage {

    /// 加载token
    func loadAccessToken(code: String, completion: @escaping (_ isSuccess: Bool) -> () )  {
        
        let urlstring = "https://api.weibo.com/oauth2/access_token"
       
        let params = ["client_id": WBAppKey,
                      "client_secret": WBAppSecret,
                      "grant_type": "authorization_code",
                      "code": code,
                      "redirect_uri": WBRedirectURI]
        
        //发起网络请求
        
       request(HTTPrequest: .POST, URLSting: urlstring, parameters: params as [String : AnyObject]) { (json, isSuccess) in
        
        
        //直接设置useraccount的属性
        self.userAccount.yy_modelSet(with: (json as? [String: AnyObject]) ?? [:])
        
        //加载用户头像信息
        self.loadUserInfo(completion: { (dict) in
            
            self.userAccount.yy_modelSet(with: (dict as [String: AnyObject]))
             print(self.userAccount)
            
            //保存模型
            self.userAccount.saveAccount()
            //完成回调
            completion(isSuccess)

        })
        
        
        }
       
        
        
    }


}




