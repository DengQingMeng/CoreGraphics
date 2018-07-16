//
//  PdfView.swift
//  Test
//
//  Created by AndyDeng on 2018/7/16.
//  Copyright © 2018年 AndyDeng. All rights reserved.
//

import Foundation
import UIKit

class PdfView: UIView {
    var path: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0, y: self.bounds.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        let url = URL.init(fileURLWithPath: path) as CFURL
        let pdf = CGPDFDocument.init(url)
        let page = pdf?.page(at: 1)
        context?.saveGState()
        context?.drawPDFPage(page!)
        context?.restoreGState()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
