//
//  AppDelegate.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

 
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     // 实例化 window
             window = UIWindow()
             window?.backgroundColor =  UIColor.white
            
     // 设置根控制器
            
            window?.rootViewController = WBMainViewController()
            
           // window可见
            
             window?.makeKeyAndVisible()
            
            loadappInfo()
            return true
           }

}


// MARK: - 从服务器加载json。只是模拟过程

extension AppDelegate{

  fileprivate func loadappInfo()
  {
    DispatchQueue.global().async {
        
        // 获取   url
        let url = Bundle.main.url(forResource: "myarray.json", withExtension: nil)
        
        //  data
        let data = NSData(contentsOf: url!)
        
        // 写入数据
        
        let disdor = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let jsonpath = (disdor as NSString).appendingPathComponent("netlocat.json")
        
        data?.write(toFile: jsonpath, atomically: true)
        
        print("加载应用完成\(jsonpath) ") 
    }
    
    
    
    }

}
