//
//  WBHomeViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

// 全局变量 cellId
  fileprivate let cellId = "cellId"


class WBHomeViewController: WBBaseViewController {

    
    fileprivate lazy var statusList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    override func loadDate() {
        for i in 0..<10 {
            statusList.insert(i.description, at: 0)
        }
    }
    
    
    // 显示好友
    @objc fileprivate func shouFrident(){

        print(#function)
        let vc = WBDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

// MARK: - 表格数据源方法
extension WBHomeViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1,取cell
         let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // 2,设置cell
        
          cell.textLabel?.text = statusList[indexPath.row]
        
        // 3,返回cell
        return cell
        
    }

    
}



// 设置界面
extension WBHomeViewController{
   // 重写父类
    override func setupUI() {
        super.setupUI()
        print("重写setupui")
       //设置导航栏按钮

       natitem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(shouFrident))
        
       // 注册原型cellId
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    
  }










