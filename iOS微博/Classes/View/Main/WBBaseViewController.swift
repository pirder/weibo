//
//  WBBaseViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     setupUI()
        // Do any additional setup after loading the view.
    }
  

}
    // 设置 界面
    // 若没有设置背景颜色，push时候会卡顿
extension WBBaseViewController{

     func setupUI(){
        print("setupUI")
        view.backgroundColor = UIColor.white
        
        
    }

}
