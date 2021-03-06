//
//  WBBaseViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    
    
    // 访客视图的字典信息，等待外部传进来，然后再传给里面  代理
    var visitorInfoOut: [String: String]?
    
    // 表格视图 ／可选，登陆与否    代理
    var tableView: UITableView?
    
    // 刷新控件
    var refreshControlloer: UIRefreshControl?
    
    // 上拉刷新与否
    var isPullup = false
    // lazy 加载导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.applicationFrame.width, height: 64))
    // lazy 导航条目  需要时在加载节约 内存
    lazy var natitem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           setupUI()
        
        WBNetworkMenage.shared.userLogon ?  loadDate() : ()
        
        //注册通知
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loginSuccess),
            name: NSNotification.Name(rawValue: WBuserLoginSuccessNotification),
            object: nil)
        
    }
    //注销通知
    deinit {
            NotificationCenter.default.removeObserver(self)
    }
    
    
    //  loaddate
    
    func loadDate()  {
        
        // 子类不实行方法，默认关闭自动刷新
        refreshControlloer?.endRefreshing()
    }
    // 重写title 将条目导入新的自定义 navigationBar
    override var title: String?{
    
        didSet{
            natitem.title = title
              }
     }

}
   /// 访客视图按钮监听

extension WBBaseViewController{
   
    //登录成功通知
    @objc fileprivate func loginSuccess(n: Notification){
    
        print("登录成功\(n)")
        
        //登录成功后清除未登录按钮
        natitem.leftBarButtonItem = nil
        natitem.rightBarButtonItem = nil
        
        //更新UI  view 的 getter 如果view = nil 那么重新调用viewloda
        view = nil
    
        // 注销防止两次通知
        NotificationCenter.default.removeObserver(self)
    }
    
    
   @objc fileprivate func loginbtn(){
        print("用户登录")
    //发送通知
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBuserShouldLoginNotification), object: nil)
    }
 
    @objc fileprivate func resignterbtn(){
    
      print("用户注册")
    }
}



     // 设置 界面
    // 若没有设置背景颜色，push时候会卡顿
extension WBBaseViewController  {

        fileprivate func setupUI(){
        print("setupUI")
        
        // 设置背景颜色
        view.backgroundColor = UIColor.white
       
        
        // 取消自动缩进 一般要设置
        automaticallyAdjustsScrollViewInsets = false
        

        
        setupNavigationBar()
        
        
        // 三目判断是否访客
        WBNetworkMenage.shared.userLogon ? setupTableView() :setupVistorView()
        
        
        
    }
    
    //设置表格视图-----
    
     func setupTableView(){
    
        // 表格处理
    tableView = UITableView(frame: view.bounds, style: .plain)
        
        // 添加到视图，位于navigationbar后面
    view.insertSubview(tableView!, belowSubview: navigationBar)
        
        // tableview的数据源方法 ； 子类直接实现即可
     tableView?.dataSource = self
     tableView?.delegate = self
        
        
        //设置与上方navigation的距离
        // 内容缩进
       tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height,
                                              left: 0,
                                              bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                              right: 0)
        
       //滚动条缩进
        tableView?.scrollIndicatorInsets = (tableView?.contentInset)!
        
        //设置刷新控件
           //1,实例化控件
        refreshControlloer = UIRefreshControl()
        
          // 2，添加控件到表格视图
        tableView?.addSubview(refreshControlloer!)
          // 3,添加监听方法
        refreshControlloer?.addTarget(self, action: #selector(loadDate), for: .valueChanged)
        
    }
    
    //设置访客视图
    
    fileprivate func setupVistorView(){
       
        //初始化
        let vistorview = WBVisitorVIew(frame: view.bounds)
       
        //添加访客视图
        
        view.insertSubview(vistorview, belowSubview: navigationBar)
        
        // 访客视图外部赋值进来 在这里无用，只是一个传值进来给WBvisitor 用的
        vistorview.visitorInfo = visitorInfoOut
        
        //添加按钮监听方法
        vistorview.loginButton.addTarget(self, action: #selector(loginbtn), for: .touchUpInside)
        vistorview.registerButton.addTarget(self, action: #selector(resignterbtn), for: .touchUpInside)
        
        // 注册登录barbutton
        natitem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(resignterbtn))
        natitem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginbtn))
        
    }
    // 导航------
    fileprivate func setupNavigationBar(){
        
        // 添加导航栏
        
        view.addSubview(navigationBar)
        
        // 导航栏的背景颜色
        navigationBar.barTintColor = UIColor(valueRGB: 0xF6F6F6)
        // 访客视图的导航栏按钮颜色按钮
        navigationBar.tintColor = UIColor.orange
        // 添加导航栏标题
        navigationBar.items = [natitem]
        // 导航栏字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
    
    }
    

}

// MARK: - UITableViewDataSource,UITableViewDelegate
extension WBBaseViewController: UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
    }
    
    // 基类提供方法，等待子类去实现
        //  子类不需要 super 因为父类的无作用
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 1 row
        let row = indexPath.row
        
        // 2,section
        let section = tableView.numberOfSections - 1
        
        // 判断有无数据
        if row < 0 || section < 0 {
            return
        }
        
        // 3 行数
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) && !isPullup {
            print("上拉刷新")
            // 上一次缺此函数造成错误
            isPullup = true
            
            loadDate()
            
        }
      
    }

}
