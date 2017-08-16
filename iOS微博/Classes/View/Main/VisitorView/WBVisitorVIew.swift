//
//  WBVisitorVIew.swift
//  iOS微博
//
//  Created by pirders on 2017/8/15.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit






class WBVisitorVIew: UIView {
    
    
    
    
    // 访客视图的信息字典  / imagename / message
    var visitorInfo: [String: String]? {
        
        didSet{
            // 获取字典信息
            guard let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"]
                else{
                    return
            }
            // 获取有值的时候
            
            tipLabel.text = message
            
            //首页为空不需要传值进来
            
            if message == "" {
                return
            }
            iconView.image = UIImage(named: imageName)
        }
        
    }
   
    
    
    /// 构造函数
    ///
    /// - Parameter frame: <#frame description#>
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
   fileprivate lazy var tipLabel = UILabel(title: "关注一些人，回来这里看看有什么惊喜", fontsize: 15, color: UIColor.darkGray)
    
    
    //注册按钮
    fileprivate lazy var registerButton: UIButton = UIButton(title: "注册", fontsize: 18, normalColor: UIColor.orange, highlighColor: UIColor.darkGray,image: "common_button_white_disable")
   

    
    //登录按钮
   fileprivate lazy var loginButton: UIButton = UIButton(title: "登录", fontsize: 18, normalColor: UIColor.darkGray, highlighColor: UIColor.black,image: "common_button_white_disable")
    
}


// MARK: - 设置界面的访客
extension WBVisitorVIew {
  
    func setupUI(){
    // 16 进制的颜色处理//
    backgroundColor = UIColor(valueRGB: 0xEDEDED)
        
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
        
          // 3 标签
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 20))
        // 宽度控制
        // label不够长，正好不需要 270 为 宽度， 在 UIimage+extensions里面有一个换行
//        addConstraint(NSLayoutConstraint(item: tipLabel,
//                                         attribute: .width,
//                                         relatedBy: .equal,
//                                         toItem: nil,
//                                         attribute: .notAnAttribute,
//                                         multiplier: 1.0,
//                                         constant: 270))
        
        // 注册anniu
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .left,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 20))
        addConstraint(NSLayoutConstraint(item: registerButton ,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 100))
        
        //登录按钮
        
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .right,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 20))
        addConstraint(NSLayoutConstraint(item: loginButton ,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: registerButton,
                                         attribute: .width,
                                         multiplier: 1.0,
                                         constant: 0))
    

    
    
    }
    
}
