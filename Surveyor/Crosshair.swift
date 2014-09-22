//
//  Crosshair.swift
//  Surveyor
//
//  Created by Louis Cheung on 9/22/14.
//  Copyright (c) 2014 Louis Cheung. All rights reserved.
//

import UIKit

class Crosshair: UIView {

    var bezierPath: UIBezierPath?

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: self.frame.size.width, y: frame.size.height))
        path.moveToPoint(CGPoint(x: 0, y: self.frame.size.height))
        path.addLineToPoint(CGPoint(x: self.frame.size.width, y: 0))

        path.lineWidth = 5
        UIColor.blackColor().setStroke()
        path.stroke()
    }
}
