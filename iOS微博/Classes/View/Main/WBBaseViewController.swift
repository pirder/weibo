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
extension WBBaseViewController{

    
   
    
     func setupUI(){
        print("setupUI")
        
        // 设置背景颜色
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupTableView()
    }
    
    fileprivate func setupTableView(){
    
    tableView = UITableView(frame: view.bounds, style: .plain)
        
    view.insertSubview(tableView!, belowSubview: navigationBar)
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
