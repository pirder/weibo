//
//  WBVisitorVIew.swift
//  iOS微博
//
//  Created by pirders on 2017/8/15.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBVisitorVIew: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    //图像视图
    fileprivate lazy var iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    //背景动画
  fileprivate lazy var houseIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //标签
   fileprivate lazy var tipLabel = UILabel(title: "sajdasjclxjklkc", fontsize: 15, color: UIColor.darkGray)
    
    
    //注册按钮
    fileprivate lazy var registerButton: UIButton = UIButton(title: "注册", fontsize: 18, normalColor: UIColor.orange, highlighColor: UIColor.darkGray,image: "common_button_white_disable")
   

    
    //登录按钮
   fileprivate lazy var loginButton: UIButton = UIButton(title: "登录", fontsize: 18, normalColor: UIColor.darkGray, highlighColor: UIColor.black,image: "common_button_white_disable")
    
}


// MARK: - 设置界面的访客
extension WBVisitorVIew {
  
    func setupUI(){
    
    backgroundColor = UIColor.white
        
        
        // 1 添加控件
        addSubview(iconView)
        addSubview(houseIconView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 2 取消 autoresizing
        for v in subviews {
            
            v.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        // 3 使用自动布局
          // 1 iconView /图像
         addConstraint(NSLayoutConstraint(item: iconView,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: self,
                                          attribute: .centerX,
                                          multiplier: 1.0,
                                          constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -60))
          // 2 houseIconView ／动画背景
        addConstraint(NSLayoutConstraint(item: houseIconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: houseIconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0))
        
          //

    
    
    }
    
}
