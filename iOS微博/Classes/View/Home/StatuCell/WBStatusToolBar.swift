//
//  WBStatusToolBar.swift
//  iOS微博
//
//  Created by pirders on 2017/9/6.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBStatusToolBar: UIView {

    var viewModel:WBstatuViewModel? {
    
        didSet{
        
            retweetButton.setTitle( "\(viewModel?.status.reposts_count)", for: [])
            commentButton.setTitle("\(viewModel?.status.comments_count)", for: [])

            likeButton.setTitle("\(viewModel?.status.attitudes_count)", for: [])
//
        }
    
    }
    
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!


}
