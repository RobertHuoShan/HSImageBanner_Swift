//
//  ViewController.swift
//  ImageBanner
//
//  Created by yuancan on 16/10/29.
//  Copyright © 2016年 yanmingxia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrImage: NSArray = ["http://ofmw9dt1n.bkt.clouddn.com/image_banner_1.jpg",
        "http://ofmw9dt1n.bkt.clouddn.com/image_banner_2.jpg",
        "http://ofmw9dt1n.bkt.clouddn.com/image_banner_3.jpg"];

        let frame: CGRect = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300)
        let placeHolderImage: UIImage = UIImage.init(named: "default_image")!
        
        let imageBanner: ImageBanner = ImageBanner.init(frame: frame, images: arrImage, placeholderImage: placeHolderImage)
        
        self.view.addSubview(imageBanner)
    }

  

}

