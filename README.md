# HSImageBanner_Swift
图片轮播(Swift版)

使用教程

`let arrImage: NSArray = ["http://ofmw9dt1n.bkt.clouddn.com/image_banner_1.jpg",
"http://ofmw9dt1n.bkt.clouddn.com/image_banner_2.jpg",
"http://ofmw9dt1n.bkt.clouddn.com/image_banner_3.jpg"];

let frame: CGRect = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300)
let placeHolderImage: UIImage = UIImage.init(named: "default_image")!

let imageBanner: ImageBanner = ImageBanner.init(frame: frame, images: arrImage, placeholderImage: placeHolderImage)

self.view.addSubview(imageBanner)`
