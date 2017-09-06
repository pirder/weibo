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
    
    lazy var status = [WBstatuViewModel]()
    
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
        let since_id = pullup ?  0 : (status.first?.status.id ?? 0)
        
//        取出最后一条微博数据
        let max_id = !pullup ? 0 : (status.last?.status.id ?? 0)
        
        //发起网络请求加载微博数据
        WBNetworkMenage.shared.statusList(since_id: since_id, max_id: max_id) { (List, isSuccess) in
            
            //判断网络是否成功
            if !isSuccess{
            		completion(false, false)
                return
            
            }
            var array = [WBstatuViewModel]()
            
            //遍历数组 字典转模型 还要转化为视图模型
            for dict in List ?? [] {
            
//            //1创建微博模型
//             guard let status = WBstutas.yy_model(with: dict) else{
//                continue
//                }
//                
//                array.append(WBstatuViewModel(model: status))
//            }

                let status = WBstutas()
                
                status.yy_modelSet(with: dict)
                
                let viewModel = WBstatuViewModel(model: status)
                
                array.append(viewModel)
            }
            
            print("刷新条数\(array.count) \(array)")
        
            
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
