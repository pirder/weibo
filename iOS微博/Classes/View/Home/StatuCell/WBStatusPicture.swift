//
//  WBStatusPicture.swift
//  iOS微博
//
//  Created by pirders on 2017/9/6.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBStatusPicture: UIView {

    
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
