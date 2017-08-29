//
//  WBOAuthViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/29.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

/// 通过wbview加载微博授权页面
class WBOAuthViewController: UIViewController {

    
    fileprivate lazy var weview = UIWebView()
    
    override func loadView() {
        view  = weview
        view.backgroundColor  = UIColor.white
        
        // 设置导航栏
        title = "登录新浪微博"
        // 导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回",target: self, action: #selector (close), isBack: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 监听方法
    @objc fileprivate func close(){
    
        dismiss(animated: true, completion: nil)
    }

}
