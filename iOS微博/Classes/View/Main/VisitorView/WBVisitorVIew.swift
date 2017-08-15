//
//  WBVisitorVIew.swift
//  iOS微博
//
//  Created by pirders on 2017/8/15.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBVisitorVIew: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - 设置界面的访客
extension WBVisitorVIew {
  
    func setupUI(){
    
    backgroundColor = UIColor.white
    }
    
}
