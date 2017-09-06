//
//  WBstatuListViewModel.swift
//  iOS微博
//
//  Created by pirders on 2017/8/21.
//  Copyright © 2017年 pirders. All rights reserved.
//
///负责加载数据
import Foundation

 fileprivate let   maxPullTimes = 3
/// 负责加载数据
class WBstatuListViewModel {
    
    lazy var status = [WBstutas]()
    
    var PullErrorTimes = 0
    
    /// 加载微博列表
    
    /// - Parameters:
    ///   - pullup: 是否上拉刷新
    ///   - completion: 完成回调【是否成功】
    func loadStatus(pullup: Bool ,completion: @escaping (_ isSuccess: Bool , _ shouldResfresh: Bool) -> ())  {

        //判断是否上拉刷新，同时检查一下刷新错误
        
        if pullup && PullErrorTimes > maxPullTimes {
        
           completion(true, false)
            return
        }
         
        //        取出最近一条微博的数据
        let since_id = pullup ?  0 : (status.first?.id ?? 0)
        
//        取出最后一条微博数据
        let max_id = !pullup ? 0 : (status.last?.id ?? 0)
        
        WBNetworkMenage.shared.statusList(since_id: since_id, max_id: max_id) { (List, isSuccess) in
            
            // 字典转模型
            guard  let array = NSArray.yy_modelArray(with: WBstutas.self, json: List ?? "")
                as? [WBstutas]
                
                else{
                    completion(isSuccess, false)
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
            // 判断数据上拉数据次数
            if pullup && array.count == 0 {
                
                self.PullErrorTimes += 1
                completion(isSuccess, false)
            
            }else {
            
            // 完成回调
            completion(isSuccess,true)
            }
        }
    }
}
