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

    fileprivate lazy var  listViewModel = WBstatuListViewModel()
    
    
    fileprivate lazy var statusList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    override func loadDate() {
        
        //  网络管理 加载微博数据
         print("加载数据完成\(self.listViewModel.status.last?.text ?? "没有数据刷新")")
       listViewModel.loadStatus(pullup: self.isPullup){ (isSuccess, shouldResfresh) in
        
        
           print("加载数据")
        // 结束下拉刷新控件
        self.refreshControlloer?.endRefreshing()
        
        // 把ispullup 恢复 false
        self.isPullup = false
        
        //  刷新加载表格
        if shouldResfresh {
        self.tableView?.reloadData()
        }
        }

        
}
    
    
        
        
        
        
        // 模拟延时加载
       // print("开始加载数据")
//        // 尾随闭包
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()  ) {
//            for i in 0..<15 {
//                
//                if self.isPullup {
//                
//                   //上拉 在底部加入数据
//                    self.statusList.append("上拉记载的数据 \(i)")
//                  }
//                else{
//                    
//                self.statusList.insert(i.description, at: 0)
//                    
//                    }
//            }
//            
//       print("加载数据")
//           // 结束下拉刷新控件
//            self.refreshControlloer?.endRefreshing()
//            
//            // 把ispullup 恢复 false
//            self.isPullup = false
//            
//            //  刷新加载表格
//            self.tableView?.reloadData()
    
    
    
    
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
        return listViewModel.status.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1,取cell
         let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // 2,设置cell
        
          cell.textLabel?.text = listViewModel.status[indexPath.row].text
        
        // 3,返回cell
        return cell
        
    }

    
}



// 设置界面
extension WBHomeViewController{
   // 重写父类
    override func setupTableView() {
       
        super.setupTableView()
        print("重写setupui")
       //设置导航栏按钮

       natitem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(shouFrident))
        
       // 注册原型cellId
        tableView?.register(UINib(nibName: "WBStatusCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        setupNavTitle()
        
    }
    
    fileprivate func setupNavTitle(){
    
        let title = WBNetworkMenage.shared.userAccount.screen_name
        
        let btn = WBTiltebutton(title: title)
        
        //navigation 的titleview 改为button
        natitem.titleView = btn
       
        
        btn.addTarget(self, action: #selector(touchtitleinside), for: .touchUpInside)
    
        
        
            }

    
    //把btn传进来
    @objc func touchtitleinside(btn:  UIButton){
        
        btn.isSelected =  !btn.isSelected
    }

    
    
    
  }










