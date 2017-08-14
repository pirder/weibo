//
//  UIBarButton+Extensions.swift
//  iOS微博
//
//  Created by pirders on 2017/8/14.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

extension UIBarButtonItem{

    /// - 创建UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title 名
    ///   - Size:  size 默认17号
    ///   - target: target
    ///   - action: action 
    convenience  init(title: String,Size: CGFloat = 17,target: Any?, action: Selector){
        let btn: UIButton = UIButton()
        
        btn.setTitle(title, for: .normal)
        btn.setTitle(title, for: .highlighted)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange , for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.sizeToFit()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        // 实例化 btn
        self.init(customView: btn)
    }
}

