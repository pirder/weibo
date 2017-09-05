//
//  WBTiltebutton.swift
//  iOS微博
//
//  Created by pirders on 2017/9/5.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBTiltebutton: UIButton {

    init(title: String?){
    super.init(frame: CGRect())
        
        
        //如果登录成功title 得到的是登录后的用户名
        if title == nil  {
            setTitle("首页", for: [])
        }
        else{
        
            setTitle(title, for: [])
            setImage(UIImage(named: "navigationbar_arrow_down"), for: [])
            //选中图片
            setImage(UIImage(named:  "navigationbar_arrow_up"), for: .selected)
            }
        
        //字体加粗
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        //颜色
        setTitleColor(UIColor.darkGray, for: [])
        
        //字体大小
        sizeToFit()
         }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
    

}
