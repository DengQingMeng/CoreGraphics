//
//  DisplayView.swift
//  Test
//
//  Created by AndyDeng on 2018/7/13.
//  Copyright © 2018年 AndyDeng. All rights reserved.
//

import Foundation
import UIKit

class DisplayView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        let context = UIGraphicsGetCurrentContext()
        let path = CGMutablePath.init()
        path.move(to: CGPoint.init(x: 10, y: 20))
        path.addLine(to: CGPoint.init(x: 100, y: 20))
        path.addLine(to: CGPoint.init(x: 100, y: 100))
        path.addLine(to: CGPoint.init(x: 200, y: 100))
       
        context?.addPath(path)
        context?.drawPath(using: .fill)
        
        path.move(to: CGPoint.init(x: 200, y: 300))
        path.addLine(to: CGPoint.init(x: 300, y: 20))
        context?.addPath(path)
        context?.setStrokeColor(red: 110/255.0, green: 22/255.0, blue: 44/255.0, alpha: 1.0)
        context?.drawPath(using: .stroke)
        
        context?.addRect(CGRect.init(x: 20, y: 150, width: 100, height: 100))
        context?.drawPath(using: .fill)
        
        context?.addArc(center: CGPoint.init(x: 200, y: 500), radius: 90, startAngle: 0, endAngle: .pi, clockwise: true)
        context?.drawPath(using: .stroke)
        
        path.move(to: CGPoint.init(x: 50, y: 300))
        path.addQuadCurve(to: CGPoint.init(x: 300, y: 300), control: CGPoint.init(x: 200, y: 200))
        context?.addPath(path)
        context?.drawPath(using: .stroke)
        
        path.move(to: CGPoint.init(x: 50, y: 400))
        path.addCurve(to: CGPoint.init(x: 300, y: 400), control1: CGPoint.init(x: 100, y: 300), control2: CGPoint.init(x: 200, y: 600))
        context?.addPath(path)
        UIColor.yellow.setFill()
        context?.drawPath(using: .fillStroke)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
