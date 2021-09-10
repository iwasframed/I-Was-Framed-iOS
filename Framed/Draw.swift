//
//  Draw.swift
//  Framed
//
//  Created by Mac on 01/01/2019.
//  Copyright © 2019 ebmacs. All rights reserved.
//

import UIKit

class Draw: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        var color:UIColor = UIColor.yellow
        
        var drect = CGRect(x: (w * 0.25),y: (h * 0.25),width: (w * 0.25),height: (h * 0.25))
        var bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        //        color.set()
        //        color.setStroke()
        //        bpath.stroke()
        
        
        
        print("it ran")
        
        NSLog("drawRect has updated the view")
        
    }
}
