//
//  WBHomeViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func shouFrident(){

        print(#function)
        
        let vc = WBDemoViewController()
        
        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

// 设置界面
extension WBHomeViewController{
// 重写父类
    override func setupUI() {
        super.setupUI()
        print("重写setupui")
     
    //设置导航栏按钮
        
        let btn: UIButton = UIButton()
        btn.setTitle("好友", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange , for: .highlighted)
        btn.addTarget(self, action: #selector(shouFrident), for: .touchUpInside)
        btn.sizeToFit()

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
      // navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(shouFrident))
        
    }
  }










