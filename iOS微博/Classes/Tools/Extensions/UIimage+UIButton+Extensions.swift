//
//  UIimage+Extensions.swift
//  iOS微博
//
//  Created by pirders on 2017/8/15.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

extension UILabel{

    convenience init(title: String,fontsize: Int,color: UIColor ){
    self.init()
        text = title
        font = UIFont.systemFont(ofSize: CGFloat(fontsize))
        textColor = color
        numberOfLines = 0 //换行
        sizeToFit()
//    self.init()
        
    }
}
extension UIButton{
    
    convenience init(title: String,fontsize: Int,normalColor: UIColor,highlighColor: UIColor,image: String ) {
        self.init()
                setTitle(title, for: .normal)
                setTitleColor(normalColor, for: .normal)
                setTitleColor(highlighColor , for: .highlighted)
                 titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontsize))
                 sizeToFit()
        setBackgroundImage( UIImage( named: image), for: .normal)
    }
       }

extension UIColor {
    //用数值初始化颜色，便于生成设计图上标明的十六进制颜色
    convenience init(valueRGB: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((valueRGB & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((valueRGB & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(valueRGB & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

