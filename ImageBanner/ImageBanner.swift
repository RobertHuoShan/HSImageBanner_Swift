//
//  ImageBanner.swift
//  ImageBanner
//
//  Created by yuancan on 16/10/29.
//  Copyright © 2016年 yanmingxia. All rights reserved.
//

import UIKit

var scrollView: UIScrollView!

var imageView1: UIImageView!
var imageView2: UIImageView!
var imageView3: UIImageView!

var index1 :NSInteger!
var index2 :NSInteger!
var index3 :NSInteger!

var imageUrls : [NSURL] = [NSURL]()

var placeholderImage: UIImage!
var pageControl :UIPageControl!


class ImageBanner: UIView, UIScrollViewDelegate {

     init(frame: CGRect, images: NSArray, placeholderImage: UIImage) {
        super.init(frame: frame)
        
        scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 20, width: frame.width, height: frame.height))
        scrollView.contentSize = CGSize(width: 3*scrollView.frame.size.width, height:0)
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width, y: 0), animated: false)
        scrollView.isPagingEnabled = true;
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.delegate = self;
        self.addSubview(scrollView)
        
        imageView1 = UIImageView.init(frame: CGRect(x: scrollView.frame.size.width*0, y: 0, width: scrollView.frame.size.width, height:scrollView.frame.size.height))
        imageView2 = UIImageView.init(frame: CGRect(x: scrollView.frame.size.width*1, y: 0, width: scrollView.frame.size.width, height:scrollView.frame.size.height))
        imageView3 = UIImageView.init(frame: CGRect(x: scrollView.frame.size.width*2, y: 0, width: scrollView.frame.size.width, height:scrollView.frame.size.height))
        
        scrollView.addSubview(imageView1)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(imageView3)

        setImageBannerImage(images: images)
        setPageControl()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector:#selector(ImageBanner.setImageBannerAutoMove), userInfo: nil, repeats: true)

    }
    
    //设置图片轮播的图片
    func setImageBannerImage(images: NSArray) -> Void {
        index1 = images.count - 1;
        index2 = 0;
        index3 = 1;
        
        if (images.count == 1) {
            scrollView.isScrollEnabled = false;
            index3 = 0;
        }
        
        
        for str in images {
            let url: NSURL = NSURL.init(string: str as! String)!
            imageUrls.append(url)
        }
        
        imageView1.sd_setImage(with: (imageUrls[index1] ) as URL, placeholderImage: placeholderImage)
        imageView2.sd_setImage(with: (imageUrls[index2] ) as URL, placeholderImage: placeholderImage)
        imageView3.sd_setImage(with: (imageUrls[index3] ) as URL, placeholderImage: placeholderImage)

    }
    
    //设置PageControl
    func setPageControl() -> Void {

        pageControl = UIPageControl.init(frame: CGRect(x: 0, y: scrollView.frame.size.height-20, width: scrollView.frame.size.width, height:30))
        pageControl.currentPage = 0;
        pageControl.numberOfPages = imageUrls.count;
        self.addSubview(pageControl)
    }
    
    //设置图片轮播自动切换
    func setImageBannerAutoMove() -> Void {
        
        index1 = index1+1
        index2 = index2+1
        index3 = index3+1
        
        if (index1 == imageUrls.count) {
            index1 = 0
        }
        if (index2 == imageUrls.count) {
            index2 = 0
        }
        if (index3 == imageUrls.count) {
            index3 = 0
        }
        
        imageView1.sd_setImage(with: (imageUrls[index1]) as URL, placeholderImage: placeholderImage)
        imageView2.sd_setImage(with: (imageUrls[index2]) as URL, placeholderImage: placeholderImage)
        imageView3.sd_setImage(with: (imageUrls[index3]) as URL, placeholderImage: placeholderImage)
        
        pageControl.currentPage = index2
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width, y: 0), animated: false)


    }
    
    //设置图片轮播手动切换
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.x == 0) { //往左滑
            
            index1 = index1-1
            index2 = index2-1
            index3 = index3-1
            
            if (index1 == -1) {
                index1 = imageUrls.count-1
            }
            if (index2 == -1) {
                index2 = imageUrls.count-1
            }
            if (index3 == -1) {
                index3 = imageUrls.count-1
            }
            
        } else if (scrollView.contentOffset.x == scrollView.frame.size.width*2) {
            
            index1 = index1+1
            index2 = index2+1
            index3 = index3+1
            
            if (index1 == imageUrls.count) {
                index1 = 0
            }
            if (index2 == imageUrls.count) {
                index2 = 0
            }
            if (index3 == imageUrls.count) {
                index3 = 0
            }
            
        } else {
           return
        }
        
        imageView1.sd_setImage(with: (imageUrls[index1]) as URL, placeholderImage: placeholderImage)
        imageView2.sd_setImage(with: (imageUrls[index2]) as URL, placeholderImage: placeholderImage)
        imageView3.sd_setImage(with: (imageUrls[index3]) as URL, placeholderImage: placeholderImage)
        
        pageControl.currentPage = index2
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width, y: 0), animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
