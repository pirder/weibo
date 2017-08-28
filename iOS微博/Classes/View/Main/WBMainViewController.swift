//
//  WBMainViewController.swift
//  iOS微博
//
//  Created by pirders on 2017/8/11.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    //定时器
    fileprivate var timer: Timer?
    
    
    
    //主控制器
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupChildControllers()
       setcomposeButton()
    
    setupTimer()
        
    }
    
    
   
    deinit {
         // 销毁时钟
       timer?.invalidate()
    }
    
    
    /*  .portrait :竖屏
     .landscape ：横屏
     单独处理
     在这里main设置之后，所有的子控制器都遵守此
     */
    
    /// .portrait :竖屏
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
    return .portrait
     
    }
    
    
    // 写微博
   @objc fileprivate func  composeStatus() {
        
        print("写微博")
    }

    fileprivate lazy var composeButton: UIButton = UIButton(type: .custom)
}


// MARK: - 时钟相关
extension WBMainViewController{

    fileprivate func setupTimer(){
     //实例化时钟  // 刷新时间自己设置
        timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    /// 时钟调用方法
    @objc fileprivate func updateTimer(){
     
        WBNetworkMenage.shared.unreadCount { (count) in
            
            //设置 首页tabbaritem 的  badgenubmer
            
            self.tabBar.items?[0].badgeValue = count > 0 ? "\(count)" : nil
            
            
        }

    
    }

}






extension  WBMainViewController {

    // 设置按钮
    fileprivate func setcomposeButton(){
        // 将按钮加入我们的tabbar
        tabBar.addSubview(composeButton)

        //  button的背景图片
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"),
                                         for: .highlighted)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"),
                               for: .highlighted)

        // 计算出tabbar 的位置，确定我们的按钮的位置
        let count = CGFloat( childViewControllers.count)
        let w = tabBar.bounds.width / count
        let h = tabBar.bounds.height
      
        //设置位置。
        composeButton.center = CGPoint(x: tabBar.center.x , y: tabBar.bounds.size.height * 0.5 )
       composeButton.bounds.size.height = h
        composeButton.bounds.size.width = w + 4
           // 按钮监听
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        }
    
    
    
    //设置子控制器
  fileprivate func  setupChildControllers()
    {
        
        // 从沙盒中访问json  //可随时更新
        
        let disdor = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let jsonpath = (disdor as NSString).appendingPathComponent("netlocat.json")
        
        var data = NSData(contentsOfFile: jsonpath)
        
        if data == nil {
        
            let path = Bundle.main.path(forResource: "newarray.json", ofType: nil)
             data = NSData(contentsOfFile: path!)

        
        }
        
        
        
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]]
            else {
                return
        }
        
        // 遍历数组，不断创建控制器数组  ／／用json
        var arrayM = [UIViewController]()
        
        
        for dict in array! {
          
            arrayM.append(controller(dict: dict  ))
        }
        
        //  设置给子控制器
        viewControllers =  arrayM
        
    }
    
    
    
    
    
  fileprivate  func controller(dict: [String: AnyObject]) -> UIViewController
    
  {

        guard let   clsName =  dict["clsName"] as? String ,
              let   title =  dict["title"] as? String ,
              let   imageName  =  dict["imageName"] as? String,
              let   cls = NSClassFromString (Bundle.main.namespace + "." + clsName) as?           WBBaseViewController.Type,
    let visitorDict = dict["visitorInfo"] as? [String: String]
    
            else{
                   // 存在值为nil的内容
                     return  UIViewController()
               }
      
        
        // 1》创建视图控制器
        let vc = cls.init()
    
    
        //标题的读取
        vc.title = title
    
        // 访客视图的字典赋值
        vc.visitorInfoOut = visitorDict
    
    
        //图片的读取
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName )
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted" )?.withRenderingMode(.alwaysOriginal)

        let nav = WBNavigationController(rootViewController: vc)
        
        return nav
    }
   
}





