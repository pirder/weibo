//
//  WBUser.swift
//  iOS微博
//
//  Created by pirders on 2017/9/6.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

// 微博用户模型

class WBUser: NSObject {

    var id: Int64 = 0
    
    //用户名称
    var screen_name: String?
    //用户头像
    var profile_image_url: String?
    //认证类型
    var verified_type: Int = 0
    //等级会员
    var mbrank: Int = 0
    
    override var description: String{
    
    return yy_modelDescription()
    }
}
