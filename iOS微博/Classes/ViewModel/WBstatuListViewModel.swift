//
//  WBstatuListViewModel.swift
//  iOS微博
//
//  Created by pirders on 2017/8/21.
//  Copyright © 2017年 pirders. All rights reserved.
//

import Foundation




/// <#Description#>
class WBstatuListViewModel {
    
    lazy var status = [WBstutas]()
    
    
    
    /// 加载微博列表
    ///
    /// - Parameter completion: 完成回调【是否成功】
    func loadStatus(completion: @escaping (_ isSuccess: Bool) -> ())  {
        
        WBNetworkMenage.shared.statusList { (List, isSuccess) in
            
            // 字典转模型
          guard  let array = NSArray.yy_modelArray(with: WBstutas.self, json: List ?? "") as? [WBstutas]
            
            else{
            
                completion(isSuccess)
            return
            }
            
            
            // 拼接数据
            
            self.status +=  array
            
            // 完成回调
            completion(isSuccess)

            
        }
    }
}
