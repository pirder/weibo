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
    let array =  [
      ["clsName": "WBHomeViewController","title": "首页","imageName": "home"],
      ["clsName": "WBMessageViewController","title": "消息","imageName": "message_center" ],
      ["clsName": "存放按钮位置"],
      ["clsName": "WBDiscoverViewController","title": "发现","imageName": "discover"],
      ["clsName": "WBProfileViewController","title": "我","imageName": "profile" ]
        ]
        var arrayM = [UIViewController]()
        for dict in array {
          
            arrayM.append(controller(dict: dict))
        }
        viewControllers =  arrayM
    }
    
    
    
  fileprivate  func controller(dict: [String: String]) -> UIViewController
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

