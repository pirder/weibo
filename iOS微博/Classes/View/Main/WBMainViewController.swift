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
       setcomposeButton()
        
    }
    
    /*  .portrait :竖屏
      .landscape ：横屏
       单独处理
     在这里main设置之后，所有的子控制器都遵守此
    */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
    return .portrait
     
    }
    
    
    // 写微博
   @objc fileprivate func  composeStatus() {
        
        print("写微博")
    }

    fileprivate lazy var composeButton: UIButton = UIButton(type: .custom)
}

extension  WBMainViewController {

    // 设置按钮
    fileprivate func setcomposeButton(){
        // 将按钮加入我们的tabbar
        tabBar.addSubview(composeButton)

        //  button的背景图片
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"),
                                         for: .highlighted)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"),
                               for: .highlighted)

        // 计算出tabbar 的位置，确定我们的按钮的位置
        let count = CGFloat( childViewControllers.count)
        let w = tabBar.bounds.width / count
        let h = tabBar.bounds.height
      
        //设置位置。
        composeButton.center = CGPoint(x: tabBar.center.x , y: tabBar.bounds.size.height * 0.5 )
       composeButton.bounds.size.height = h
        composeButton.bounds.size.width = w + 4
           // 按钮监听
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        }
    
    
    
    //设置子控制器
  fileprivate func  setupChildControllers()
    {
        // 能够通过网络json 获取到
        
        /// clsName,title,imageName,visitorInfo
        let array =  [
            
        ["clsName": "WBHomeViewController","title": "首页","imageName": "home",
       "visitorInfo": [ "imageName": "",  "message": "关注一些人，回来这里看看有什么惊喜"]
        ],
        
        
        ["clsName": "WBMessageViewController","title": "消息","imageName": "message_center",
         "visitorInfo": [ "imageName": "visitordiscover_image_message",  "message": "登录后，别人评论的微博，发给你的消息，都会在这里收到通知哦"]
            ],
        
      ["clsName": "存放按钮位置"],
      
      ["clsName": "WBDiscoverViewController","title": "发现","imageName": "discover",
       "visitorInfo": [ "imageName": "visitordiscover_image_message",  "message": "登录后，最新，最热微博尽在掌握，不再会与事实潮流插肩而过"]],
      
      ["clsName": "WBProfileViewController","title": "我","imageName": "profile",
       "visitorInfo": [ "imageName": "visitordiscover_image_profile",  "message": "登录后，你的微博，相册，个人资料会显示在这里，展现给别人"]]
            
            
        ]
        
        
        var arrayM = [UIViewController]()
        for dict in array {
          
            arrayM.append(controller(dict: dict as [String : AnyObject]))
        }
        viewControllers =  arrayM
    }
    
    
    
  fileprivate  func controller(dict: [String: AnyObject]) -> UIViewController
    
  {

        guard let   clsName =  dict["clsName"] as? String ,
              let   title =  dict["title"] as? String ,
              let   imageName  =  dict["imageName"] as? String,
              let   cls = NSClassFromString (Bundle.main.namespace + "." + clsName) as?           WBBaseViewController.Type,
    let visitorDict = dict["visitorInfo"] as? [String: String]
    
            else{
                   // 存在值为nil的内容
                     return  UIViewController()
               }
      
        
        // 1》创建视图控制器
        let vc = cls.init()
    
    
        //标题的读取
        vc.title = title
    
        // 访客视图的字典赋值
        vc.visitorInfoOut = visitorDict
    
    
        //图片的读取
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName )
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted" )?.withRenderingMode(.alwaysOriginal)

        let nav = WBNavigationController(rootViewController: vc)
        
        return nav
    }
   
}





