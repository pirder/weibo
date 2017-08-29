//
//  WBUseracount.swift
//  iOS微博
//
//  Created by pirders on 2017/8/30.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

//fileprivate let  accountFile: NSString = "useraccount.json"

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

    override init() {
        
        super.init()
        
        //从磁盘中取文件 ->字典
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let filePath = documentPaths[0] + "/useraccount.json"

       guard let data = NSData(contentsOfFile: filePath),
        let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject]
        
        else
       {
        return
        }
        
        
        //使用字典属性
        yy_modelSet(with: dict ?? [:])
        
        
    }
    
    
    func saveAccount()  {
        
        //1,模型转字典
        var dict = (self.yy_modelToJSONObject() as? [String: AnyObject]) ?? [:]
        
        //删除无用的
        dict.removeValue(forKey: "expires_in")
        
        // 字典反序列化
       guard let data = try? JSONSerialization.data(withJSONObject: dict, options: [])
        else{
            return
        }
        //文件内容
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let filePath = documentPaths[0] + "/useraccount.json"
        print(filePath)
        
        //写入磁盘
        (data as NSData).write(toFile: filePath, atomically: true)
    }
    
    
}
