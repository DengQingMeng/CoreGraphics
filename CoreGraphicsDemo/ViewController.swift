//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by AndyDeng on 2018/7/16.
//  Copyright © 2018年 AndyDeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        let displayView = DisplayView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        //        self.view.addSubview(displayView)
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = (paths.first! as NSString).appendingPathComponent("test.pdf")
        print(path)
        FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        
        UIGraphicsBeginPDFContextToFile(path, CGRect.zero, nil)
        UIGraphicsBeginPDFPage()
        let title = "法国队夺得2018俄罗斯世界杯冠军"
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        (title as NSString).draw(in: CGRect.init(x: 20, y: 20, width: 300, height: 40), withAttributes: [kCTFontAttributeName as NSAttributedStringKey: UIFont.boldSystemFont(ofSize: 18), kCTParagraphStyleAttributeName as NSAttributedStringKey: style])
        
        let img = UIImage(named: "timg.jpeg")
        img?.draw(in: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        
        //创建新的一页继续绘制
        UIGraphicsBeginPDFPage()
        let imgtwo = UIImage(named: "timg.jpeg")
        imgtwo?.draw(in: CGRect.init(x: 100, y: 20, width: 100, height: 100))
        
        UIGraphicsEndPDFContext()
        
        let pdfView = PdfView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width+237, height: 792))
        pdfView.path = path
        self.view.addSubview(pdfView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

