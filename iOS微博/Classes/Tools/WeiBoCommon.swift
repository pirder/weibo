//
//  WeiBoCommon.swift
//  iOS微博
//
//  Created by pirders on 2017/8/29.
//  Copyright © 2017年 pirders. All rights reserved.
//

import Foundation
import UIKit
/// MARK: - 应用程序信息
///应用程序id
   let  WBAppKey = "1720063711"
///应用程序回调地址
let WBRedirectURI  = "http://baidu.com"

/// 应用程序加密信息
let  WBAppSecret =  "4535c0c7671f92f8776f5489474eb306"
/// 用户需要登录通知
let WBuserShouldLoginNotification = "WBuserShouldLoginNotification"
/// 用户成功登录通知
let WBuserLoginSuccessNotification = "WBuserLoginSuccessNotification"


/// MARK: - 配图的视图
//配图外部的边距
let WBStatusPictureViewOutMargin = CGFloat(12)
//配图内部边距
let WBStatusPictureViewInMargin = CGFloat(3)
///视图宽度
let WBStatusPictureViewWidth = UIScreen.main.bounds.width - (WBStatusPictureViewInMargin * 2)

//每个小图的宽度
let WBStatusPictureItemWidth = (WBStatusPictureViewWidth - WBStatusPictureViewInMargin * 2) / 3
