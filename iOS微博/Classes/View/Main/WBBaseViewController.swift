//
//  WBBaseViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    // 表格视图 ／可选，登陆与否
    var tableView: UITableView?
    
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
       
        
        
        setupNavigationBar()
        setupTableView()
        
        
        
    }
    
    fileprivate func setupTableView(){
    
        // 处理
    tableView = UITableView(frame: view.bounds, style: .plain)
        
        // 添加到视图，位于navigationbar后面
    view.insertSubview(tableView!, belowSubview: navigationBar)
        
        // tableview的数据源方法 ； 子类直接实现即可
     tableView?.dataSource = self
     tableView?.delegate = self
        
    }
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
  

}
