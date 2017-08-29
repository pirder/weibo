//
//  WBUseracount.swift
//  iOS微博
//
//  Created by pirders on 2017/8/30.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBUseracount: NSObject {

    //／令牌
    var access_token: String?   //= "2.00ieZlUGFJN6sBb90c7fcfc1DP9BgB"
    //／用户代号
    var uid: String?
    //／（秒）access_token生命周期
    var expires_in: TimeInterval = 0 {
        didSet {
        
            expiresDate = Date(timeIntervalSinceNow: expires_in)
        
        }
    
    }
    
    ///过期日期
    var expiresDate: Date?
    
    override var description: String{
     
        return yy_modelDescription()
    
    }

    func saveAccount()  {
        
        //1,模型转字典
        var dict = (self.yy_modelToJSONObject() as? [String: AnyObject]) ?? [:]
        
        //删除无用的
        dict.removeValue(forKey: "expires_in")
        
        // 字典反序列化
        let data = try? JSONSerialization.data(withJSONObject: dict, options: [])
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(documentPaths)
    }
    
    
}
