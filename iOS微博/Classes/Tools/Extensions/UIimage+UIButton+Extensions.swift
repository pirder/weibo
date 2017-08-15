//
//  UIimage+Extensions.swift
//  iOS微博
//
//  Created by pirders on 2017/8/15.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

extension UILabel{

    convenience init(title: String,fontsize: Int,color: UIColor ){
    self.init()
        text = title
        font = UIFont.systemFont(ofSize: CGFloat(fontsize))
        textColor = color
        numberOfLines = 0
        sizeToFit()
//    self.init()
        
    }
}
extension UIButton{
    
    convenience init(title: String,fontsize: Int,normalColor: UIColor,highlighColor: UIColor,image: String ) {
        self.init()
                setTitle(title, for: .normal)
                setTitleColor(normalColor, for: .normal)
                setTitleColor(highlighColor , for: .highlighted)
                 titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontsize))
                 sizeToFit()
        setBackgroundImage( UIImage( named: image), for: .normal)
    }
       


}
