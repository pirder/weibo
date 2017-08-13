//
//  Bundle+Extensions.swift
//  iOS微博
//
//  Created by pirders on 2017/8/13.
//  Copyright © 2017年 pirders. All rights reserved.
//

import Foundation

extension Bundle {
    
    var namespace : String {
    return  infoDictionary?["CFBundleName"] as? String ?? ""
    }
  }
