//
//  WBStatusPicture.swift
//  iOS微博
//
//  Created by pirders on 2017/9/6.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBStatusPicture: UIView {

    //配图视图数组
    var urls: [WBPicture]?{
    
        didSet{
            
            for v in subviews {
                v.isHidden = true
            }
        
            var index  = 0
            for url in urls ?? [] {
                
                let iv = subviews[index] as! UIImageView

                let uu = URL(string: url.thumbnail_pic!)
                
                iv.setImageWith(uu!)
                
                iv.isHidden = false
                
                index += 1
            }
            
        }
    }
    
        @IBOutlet weak var heigtcount: NSLayoutConstraint!

    override func awakeFromNib() {
        
        setupUi()
    }
    
}

extension WBStatusPicture{

    
    /// <#Description#>
    fileprivate func setupUi(){
    
        //超出内容不显示
        clipsToBounds = true
        
        //人图片等比例
        
        let count = 3
        
        let rect = CGRect(x: 0, y: WBStatusPictureViewOutMargin, width: WBStatusPictureItemWidth, height: WBStatusPictureItemWidth)
        
        
        for i in 0..<count * count {
            
            
            let iv = UIImageView()
       
            iv.backgroundColor = UIColor.red
            
            //行
            let row = CGFloat(i / 3)
            //列
            let col = CGFloat(i % 3)
            
            iv.frame = rect.offsetBy(dx: col * (WBStatusPictureItemWidth + WBStatusPictureViewInMargin), dy: row * (WBStatusPictureItemWidth + WBStatusPictureViewInMargin))

            addSubview(iv)
        }
        
    
    }

}
