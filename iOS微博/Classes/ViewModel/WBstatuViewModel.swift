//
//  WBstatuViewModel.swift
//  iOS微博
//
//  Created by pirders on 2017/9/6.
//  Copyright © 2017年 pirders. All rights reserved.
//

import Foundation
import UIKit
/// 单条微博视图模型

//
class WBstatuViewModel: CustomStringConvertible{
    
    
    
    ///微博模型
    var status: WBstutas
    
    //存储型属性 //性能优化，用内存去换cpu，提前计算好，不用计算
    var memberIcon: UIImage?
    
    var vipIcon: UIImage?
    
    
    
    /// 构造函数
    ///
    /// - Parameter model: 微博模型
        init(model: WBstutas) {
        self.status = model
            
            //计算出会员图标
            if (model.user?.mbrank)! > 0 && (model.user?.mbrank)! < 7 {
                let imagename = "common_icon_membership_level\(model.user?.mbrank ?? 1)"
                
                memberIcon = UIImage(named: imagename)
            
            }
            else{
               memberIcon = UIImage(named: "common_icon_membership_expired")
            }
            
            //
            switch model.user?.verified_type ?? -1 {
            case 0:
                vipIcon = UIImage(named: "avatar_enterprise_vip")
            case 2,3,4,5:
                vipIcon = UIImage(named: "avatar_vip")
            
            case 220:
                
                vipIcon = UIImage(named: "avatar_grassroot")
                
            default:
              break
            }
            
            
            
    }
    
    
    var description: String{
    
        return status.description
    
    }
    
    
    
}
