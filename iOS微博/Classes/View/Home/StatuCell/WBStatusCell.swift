//
//  WBStatusCell.swift
//  iOS微博
//
//  Created by pirders on 2017/9/5.
//  Copyright © 2017年 pirders. All rights reserved.
//

import UIKit

class WBStatusCell: UITableViewCell {

    //微博视图模型
    var viewModel: WBstatuViewModel?{
    
        didSet{
        //微博姓名
            StatusLabel.text = viewModel?.status.text
        //微博正文
            nameLabel.text = viewModel?.status.user?.screen_name
            
        //微博会员图标
            numberIconView.image = viewModel?.memberIcon            
       //设置认证图标
            vipIconView.image = viewModel?.vipIcon
       //用户头像
            IconView.et_setImage(urlstring: viewModel?.status.user?.profile_image_url, placeholderImage: UIImage(named: "navigationbar_friendsearch"))
      //添加工具栏
         toolBar.viewModel = viewModel
            
            //高度辩护
            pictureVIew.heigtcount.constant = viewModel?.pictureViewSize.height ?? 0
            
//            //4张图像
//            if (viewModel?.status.pic_urls?.count)! > 4 {
//                
//                var picURls = viewModel?.status.pic_urls
//                
//                picURls?.removeSubrange((picURls?.startIndex)! + 4 ..< (picURls?.endIndex)!)
//                pictureVIew.urls = picURls
//
//            }else{
//            
//            pictureVIew.urls = viewModel?.status.pic_urls
//            }
            pictureVIew.urls = viewModel?.status.pic_urls

            
            
        }
    
    
    }
    
  
    //头像
    @IBOutlet weak var IconView: UIImageView!
    //名字
    @IBOutlet weak var nameLabel: UILabel!
    //会员
    @IBOutlet weak var numberIconView: UIImageView!
    //时间
    @IBOutlet weak var timeLabel: UILabel!
    //来源
    @IBOutlet weak var sourceLabel: UILabel!
    //正文
    @IBOutlet weak var StatusLabel: UILabel!
    //认证图标
    @IBOutlet weak var vipIconView: UIImageView!
    //底部工具
    @IBOutlet weak var toolBar: WBStatusToolBar!
    
    @IBOutlet weak var pictureVIew: WBStatusPicture!
    


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
