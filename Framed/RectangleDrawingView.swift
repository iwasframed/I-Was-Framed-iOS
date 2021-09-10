//
//  RectangleDrawingView.swift
//  Framed
//
//  Created by Dr. Atta on 20/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit

class RectangleDrawingView: UIView {

	var width : CGFloat = 0
	var height: CGFloat = 0
	var borderColor = UIColor.black
	var rect : CGRect = CGRect()
	
	init(_ frame:CGRect, _ rect: CGRect , _ color : UIColor){
		super.init(frame: frame)
		self.width = rect.width
		self.height = rect.height
		self.rect = rect
		self.borderColor = color
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func draw(_ rect: CGRect) {
		drawRectangle(self.rect)
	}
	
	func drawRectangle( _ randomeRect : CGRect) {
		//		let center = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
		//		let rectangleWidth:CGFloat = 100.0
		//		let rectangleHeight:CGFloat = 100.0
		
		
		let rect = randomeRect
		
		guard let ctx = UIGraphicsGetCurrentContext() else { return }
		
		//4
		ctx.addRect(rect)
		ctx.setLineWidth(30)
		ctx.setStrokeColor(self.borderColor.cgColor)
		ctx.strokePath()
		
	}
	

	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
