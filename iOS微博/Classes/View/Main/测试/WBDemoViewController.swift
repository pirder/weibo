//
//  WBDemoViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/14.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "第\((navigationController?.childViewControllers.count)!-1) 个"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func shouNext(){
    let vc = WBDemoViewController()
        
     navigationController?.pushViewController(vc, animated: true)
        
    }
}




extension WBDemoViewController{
    // 重写父类方法
    override func setupUI() {
        
        super.setupUI()
    //    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(shouNext))
    
//        let btn: UIBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(shouNext))
//        btn.tintColor = UIColor.darkGray
     //    navigationItem.rightBarButtonItem = btn
        let btn: UIButton = UIButton()
        btn.setTitle("下一个", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange , for: .highlighted)
        btn.addTarget(self, action: #selector(shouNext), for: .touchUpInside)
        btn.sizeToFit()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)

    }
}
