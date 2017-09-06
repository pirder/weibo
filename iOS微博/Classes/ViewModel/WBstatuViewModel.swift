//
//  WBstatuViewModel.swift
//  iOS微博
//
//  Created by pirders on 2017/9/6.
//  Copyright © 2017年 pirders. All rights reserved.
//

import Foundation

/// 单条微博视图模型

//
class WBstatuViewModel: CustomStringConvertible{
    
    
    
    ///微博模型
    var status: WBstutas
    
    /// 构造函数
    ///
    /// - Parameter model: 微博模型
        init(model: WBstutas) {
        self.status = model
    }
    
    
    var description: String{
    
        return status.description
    
    }
    
    
    
}
