//
//  WBstutas.swift
//  iOS微博
//
//  Created by pirders on 2017/8/20.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit
import YYModel
class WBstutas: NSObject {

    // int类型
    var id: Int64 = 0
    // 微博信息内容
    var text: String?
    
    /// 微博用户
    var user: WBUser?
    
    //重写该计算型属性
    override var description: String{
    
        return yy_modelDescription()
    
    }
}
