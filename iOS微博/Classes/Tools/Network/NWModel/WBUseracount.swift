//
//  WBUseracount.swift
//  iOS微博
//
//  Created by pirders on 2017/8/30.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBUseracount: NSObject {

    //令牌
    var access_token: String?
    //用户代号
    var uid: String?
    //过期日期（秒）access_token生命周期
        var expires_in: TimeInterval = 0
    
    override var description: String{
     
        return yy_modelDescription()
    
    }
}
