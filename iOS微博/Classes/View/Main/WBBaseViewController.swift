//
//  WBBaseViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.applicationFrame.width, height: 64))
    lazy var natitem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           setupUI()
        // Do any additional setup after loading the view.
    }
    override var title: String?{
    
        didSet{
            natitem.title = title
        }
    }

}
    // 设置 界面
    // 若没有设置背景颜色，push时候会卡顿
extension WBBaseViewController{

    
   
    
     func setupUI(){
        print("setupUI")
        // 添加导航栏
        
        view.addSubview(navigationBar)
        // 添加导航栏标题
        navigationBar.items = [natitem]
        
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
        // 设置背景颜色
        view.backgroundColor = UIColor.white
        
        
        
    }

}
