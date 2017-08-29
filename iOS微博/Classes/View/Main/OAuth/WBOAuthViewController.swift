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

    
    fileprivate lazy var webview = UIWebView()
    
    override func loadView() {
        view  = webview
        view.backgroundColor  = UIColor.white
        
        // 设置导航栏
        title = "登录新浪微博"
        // 导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回",target: self, action: #selector (close), isBack: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充",target: self, action: #selector(antoFill), isBack: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       //加载授权界面
        let urlstring = "https://api.weibo.com/oauth2/authorize?client_id=\(WBAppKey)&redirect_uri=\(WBRedirectURI)"
       
        //url确定访问资源
        guard let url = URL(string: urlstring)
            else {
            return
        }
        
        //建立请求
        let request = URLRequest(url: url)
        
        //加载请求
        webview.loadRequest(request)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 监听方法
    @objc fileprivate func close(){
    
        dismiss(animated: true, completion: nil)
    }
    @objc fileprivate func antoFill(){
    
     let js =  "document.getElementById('userId').value = '13537003186';"  + "document.getElementById('passwd').value = 'ZHANGYUHUI56';"
        
        //执行js
    webview.stringByEvaluatingJavaScript(from: js)
    }


}
