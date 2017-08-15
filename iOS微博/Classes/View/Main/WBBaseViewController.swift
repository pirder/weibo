//
//  WBBaseViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    // 用户登录与否
    var userLogon = false
    // 表格视图 ／可选，登陆与否
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
        
        loadDate()
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

     // 设置 界面
    // 若没有设置背景颜色，push时候会卡顿
extension WBBaseViewController  {

    
   
    
     func setupUI(){
        print("setupUI")
        
        // 设置背景颜色
        view.backgroundColor = UIColor.white
       
        
        // 取消自动缩紧 一般要设置
        automaticallyAdjustsScrollViewInsets = false
        

        
        setupNavigationBar()
        
        
        // 三目判断是否访客
        userLogon ? setupTableView() :setupVistorView()
        
        
        
    }
    
    //设置表格视图-----
    
    fileprivate func setupTableView(){
    
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
    
        let vistorview = UIView(frame: view.bounds)
        
        vistorview.backgroundColor = UIColor.white
        
        view.insertSubview(vistorview, belowSubview: navigationBar)
    }
    // 导航------
    fileprivate func setupNavigationBar(){
        
        // 添加导航栏
        
        view.addSubview(navigationBar)
        
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
            print("shanglashuax")
        }
        print("section  \(section)")
         print("cout     \(count)")
        print(row)
    }

}
