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

        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
       //除了根控制器外都必须隐藏底部的导航栏 根数目子控制器 = 0
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        //调用父类的
        super.pushViewController(viewController, animated: true)
    }

  

}
