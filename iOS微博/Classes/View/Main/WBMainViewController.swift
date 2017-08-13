//
//  WBMainViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    //主控制器
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupChildControllers()
       
    }
}


extension  WBMainViewController {

    //设置子控制器


    func  setupChildControllers()
    {
    let array =  [
      ["clsName": "WBHomeViewController","title": "首页","imageName": "home"],
      ["clsName": "WBMessageViewController","title": "消息","imageName": "message_center" ],
      ["clsName": "WBDiscoverViewController","title": "发现","imageName": "discover"],
      ["clsName": "WBProfileViewController","title": "我","imageName": "profile" ]
        ]
        var arrayM = [UIViewController]()
        for dict in array {
          
            arrayM.append(controller(dict: dict))
        }
        viewControllers =  arrayM
    }
    
    
    
    func controller(dict: [String: String]) -> UIViewController
     {

        guard let   clsName =  dict["clsName"],
              let   title =  dict["title"],
              let   imageName  =  dict["imageName"],
              let   cls = NSClassFromString (Bundle.main.namespace + "." + clsName) as?           UIViewController.Type
            else{
                   // 存在值为nil的内容
                     return  UIViewController()
               }
      
//         let cls = UIViewController.self   //当初测试所用
        // 1》创建视图控制器
        let vc = cls.init()
        //标题的读取
        vc.title = title
        //图片的读取
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName )
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted" )?.withRenderingMode(.alwaysOriginal)

        let nav = WBNavigationController(rootViewController: vc)
        
        return nav
    }
   
}




//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//

