//
//  WBNavigationController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 隐藏原系统的导航栏，在wb base vc自定义
        navigationBar.isHidden = true
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        

        // Dispose of any resources that can be recreated.
    }
    
 // push 进去
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
//        // 设置导航栏title颜色
//            navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
        
        //  设置左边的返回
      
        
        
        //除了根控制器外都必须隐藏底部的导航栏 根数目子控制器 = 0
        
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
  
            
            // 只有一个子控制器时候，返回改为“”首页“” 或者其他的“我”。。。
            if let vc = viewController as? WBBaseViewController{
                

                var title = "返回"
      //   print("进入")
                if childViewControllers.count == 1 {
                  
                   title = childViewControllers.first?.title ?? "返回"
                    
                }
                
                vc.natitem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToIsback))
                
            }
         
        }
        
        
        //调用父类的
        super.pushViewController(viewController, animated: true)
      
    }
    
 //pop 返回上一页
    @objc fileprivate func popToIsback(){
      
     self.popViewController(animated: true)
        
        }
     
    }


