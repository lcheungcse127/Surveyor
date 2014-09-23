//
//  Crosshair.swift
//  Surveyor
//
//  Created by Louis Cheung on 9/22/14.
//  Copyright (c) 2014 Louis Cheung. All rights reserved.
//

import UIKit

class Crosshair: UIView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.baseInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseInit()
    }

    func baseInit() {
        self.backgroundColor = UIColor.clearColor()
    }

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: self.frame.size.width, y: frame.size.height))
        path.moveToPoint(CGPoint(x: 0, y: self.frame.size.height))
        path.addLineToPoint(CGPoint(x: self.frame.size.width, y: 0))

        UIColor.whiteColor().setStroke()
        path.stroke()
    }
}
