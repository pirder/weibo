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
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - pullup: 是否上拉刷新
    ///   - completion: 完成回调【是否成功】
    func loadStatus(pullup: Bool ,completion: @escaping (_ isSuccess: Bool) -> ())  {
//        取出最近一条微博的数据
        let since_id = pullup ?  0 : (status.first?.id ?? 0)
        
//        取出最后一条微博数据
        let max_id = !pullup ? 0 : (status.last?.id ?? 0)
        
        WBNetworkMenage.shared.statusList(since_id: since_id, max_id: max_id) { (List, isSuccess) in
            
            // 字典转模型
            guard  let array = NSArray.yy_modelArray(with: WBstutas.self, json: List ?? "")
                as? [WBstutas]
                
                else{
                    completion(isSuccess)
                    return
            }
            
            print("刷新条数\(array.count)")
            print("刷新上拉")

            
            if pullup {
                // 拼接数据 旧的数据的放在最下面
                self.status += array
                
            }
            else{
            // 拼接数据 最新的放在最上面
            self.status = array +  self.status
            }
            // 完成回调
            completion(isSuccess)

        }
              
        
            
        
    }
}
