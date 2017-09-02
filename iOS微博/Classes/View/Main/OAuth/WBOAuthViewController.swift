//
//  WBOAuthViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/29.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit
import SVProgressHUD

/// 通过wbview加载微博授权页面
class WBOAuthViewController: UIViewController {

    
    fileprivate lazy var webview = UIWebView()
    
    override func loadView() {
        view  = webview
        
        view.backgroundColor  = UIColor.white
        
        //取消滚动
        webview.scrollView.isScrollEnabled = false
        
        //设置代理
        webview.delegate = self
        
        
        
        
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
        SVProgressHUD.dismiss()
        dismiss(animated: true, completion: nil)
    }
    @objc fileprivate func antoFill(){
    
     let js =  "document.getElementById('userId').value = '13537003186';"  + "document.getElementById('passwd').value = 'ZHANGYUHUI56';"
        
        //执行js
    webview.stringByEvaluatingJavaScript(from: js)
    }

    

}
extension WBOAuthViewController: UIWebViewDelegate{


    /// webview将要加载请求
    ///
    /// - Parameters:
    ///   - webView: webview
    ///   - request: 要加载的请求
    ///   - navigationType: 导航类型
    /// - Returns: 是否加载request
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        //如果请求地址中含有www.baiu.com 不加载／加载页面
        // 如果没有baidu.com
        if request.url?.absoluteString.hasPrefix(WBRedirectURI) == false {
            
            return true
        }
        
        print("加载请求 ---\(request.url?.absoluteString ?? "出现错误") ")
        
        // query URL中“？”后面的所有部分
        print("加载请求 ---\(request.url?.query ?? "") ")

        
        // 如果有code= 授权成功，否则授权失败
        
        if request.url?.query?.hasPrefix("code=") == false {
            print("取消授权")
            close()
            return false
        }
        
        
        //从query里获取授权码
        //URL中一定有code
    let code = request.url?.query?.substring(from: "code=".endIndex) ?? ""
        
        print("授权码 - \(code)")
        
        //使用授权码获取token
        WBNetworkMenage.shared.loadAccessToken(code: code) { (isSuccess) in
            
            if !isSuccess {
                SVProgressHUD.showInfo(withStatus: "网络请求失败")
            }
            else{
            SVProgressHUD.showInfo(withStatus: "登录成功")
                
                //发送通知
                NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: WBuserLoginSuccessNotification),
                    object: nil)
                
                
                self.close()
                
            }
        }
       
        
        //登录成功后还有菊花
        return false
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        SVProgressHUD.show()
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        SVProgressHUD.dismiss()
        
    }

}


