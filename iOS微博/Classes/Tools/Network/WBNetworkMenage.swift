//
//  WBNetworkMenage.swift
//  iOS微博
//
//  Created by pirders on 2017/8/18.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit
import AFNetworking


enum WBHTTPrequest {
    case GET
    case POST
}



//网络管理
class WBNetworkMenage: AFHTTPSessionManager {

   ///静态区域 ／常量／闭包
    static let shared = WBNetworkMenage()
    
    // token令牌  
    var tokenOut: String? = "2.00ieZlUGFJN6sB5fa251acd6WZhpsB"
    
    func tokenRequest(HTTPrequest: WBHTTPrequest,URLSting: String,parameters: [String: AnyObject]?,completion:
        @escaping (_ json: AnyObject?,_ issuccess: Bool)->()) {
        
        
        // 如果token为空 下面都不执行，没有登录
        
        guard let tokenIn = tokenOut else {
            print("没有token 没有登录")
            
            completion(nil, false)
            
            return
        }
        
        
        
        
       // 处理token的字典。如果没有就创建
                var parameters = parameters
        if parameters == nil {
            
            //实例化字典
            parameters = [String: AnyObject]()
        }
        // 赋值给其，下一步调去来加载网络请求
        
        parameters!["access_token"] = tokenIn as AnyObject
        
        // 发起真正的网络请求
        request(HTTPrequest: .GET, URLSting: URLSting, parameters: parameters, completion: completion)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // 逃逸闭包？获取回调参数
    /// 封装GET/POST 请求
    ///
    /// - Parameters:
    ///   - HTTPrequest: GET/POST
    ///   - URLSting: URLString
    ///   - parameters: 参数的字典
    ///   - completion: 完成回调json 还有是否成功
    func request ( HTTPrequest: WBHTTPrequest,URLSting: String,parameters: [String: AnyObject]?,completion:
        @escaping (_ json: AnyObject?,_ issuccess: Bool)->())

{
    
        let success = { (taTask: URLSessionDataTask,json: Any) -> () in
          
            completion(json as AnyObject, true) //json回调
    }
    
        let failure = { (taTask: URLSessionDataTask?,error: Error ) -> () in
            
           print("网络错误\(error)")
            completion( nil, false)// issuccess回调
    
    }
        
        
        if HTTPrequest == .GET {
           
            get(URLSting, parameters: parameters, progress: nil, success: success , failure: failure )
        }
        else{
        
             post(URLSting, parameters: parameters, progress: nil, success: success , failure: failure )
          }
    }
}







