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
            return true
           }

}

