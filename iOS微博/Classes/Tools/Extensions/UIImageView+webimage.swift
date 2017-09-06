//
//  UIImageView+webimage.swift
//  iOS微博
//
//  Created by pirders on 2017/9/6.
//  Copyright © 2017年 pirders. All rights reserved.
//

import Foundation
//网络图框架
import SDWebImage

extension UIImageView{


    func et_setImage(urlstring: String?,placeholderImage: UIImage?)  {
        
        guard let urlstring = urlstring,
            let url = URL(string: urlstring),
        let image = placeholderImage else {
            return
        }
       sd_setImage(with: url, placeholderImage: image, options: []) { (image, _, _, _) in
        
        }
    }
    
}
