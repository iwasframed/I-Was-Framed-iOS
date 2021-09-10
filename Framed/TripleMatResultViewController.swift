//
//  ResultsViewController.swift
//  Framed
//
//  Created by Dr. Atta on 02/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import ChainableAnimations

extension TripleMatResultViewController{
    func drawShape() {
        
        //        let rect = CGRect(x: self.drawArea.bounds.midX - (frameRect.width / 2), y: self.drawArea.bounds.midY - (frameRect.height / 2), width: self.frameRect.width, height: frameRect.height)
        //
        //        self.frameRect = rect
        //        if frameRect.width > drawArea.frame.width{
        //            frameRect.size.width = drawArea.frame.width - 30
        //        }
        //
        //        if frameRect.height > drawArea.frame.height
        //        {
        //            frameRect.size.height = drawArea.frame.height - 30
        //        }
        //
        
        let layer = CAShapeLayer()
        //layer.path = UIBezierPath.init(rect: self.drawArea.frame).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 30
        layer.strokeColor = self.border.cgColor
        
        //        drawArea.addSubview(rectView)
//        drawArea.layer.addSublayer(layer)
        
        self.TTMFrameView.backgroundColor = self.border
        self.addLabels(frameRect)
        self.addLabels2(frameRect)
        self.addLabels3(frameRect)
    }
    
    func addLabels(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.wText
                
                self.lblTTMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTTMTFrameWidth.text = self.wText
                //self.lblTTMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTTMBFrameWidth.text = self.wText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.wText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblTTMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblTTMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTTMBFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.wText
            self.lblTTMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTTMTFrameWidth.text = self.wText
            //self.lblTTMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTTMBFrameWidth.text = self.wText
        }
//        self.drawArea.addSubview(yourLabel)
    }
    
    func addLabels2(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.hText
                
                self.lblTTMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTTMLFrameHeight.text = self.hText
                
                //self.lblTTMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTTMRFrameHeight.text = self.hText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.hText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblTTMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblTTMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTTMRFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.hText
            
            self.lblTTMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTTMLFrameHeight.text = self.hText
            
            //self.lblTTMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTTMRFrameHeight.text = self.hText
        }
        //lblTTMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblTTMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
        if isFirstTimeFrame{
            let point = CGSize(width: self.lblTTMLFrameHeight.frame.height , height: self.lblTTMLFrameHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTTMLFrameHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblTTMRFrameHeight.frame.height , height: self.lblTTMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblTTMRFrameHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
            isFirstTimeFrame = false
        }

        
    }
    
    func addLabels3(_ rect:CGRect){
        let orig = rect.origin
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.textAlignment = .center
        labelBottom.text = "TOP MAT"
        labelBottom.textColor = UIColor(hexString: "#544F43")
        
        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(25))
        labelBottom.center = CGPoint(x: frameRect.midX, y: rect.maxY + 35);
//        self.drawArea.addSubview(labelBottom)
        
    }
}


// Middle Mat *******************************

extension TripleMatResultViewController{
    func drawShapeMiddle() {
        
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 30
        layer.strokeColor = self.border.cgColor
        
        //        drawArea.addSubview(rectView)
//        drawArea2.layer.addSublayer(layer)
        
        self.TMMFrameView.backgroundColor = self.border
        self.addLabelsMiddle(frameRect)
        self.addLabels2Middle(frameRect)
        self.addLabels3Middle(frameRect)
    }
    
    func addLabelsMiddle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.wText
                
                self.lblTMMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTMMTFrameWidth.text = self.wText
                
                //self.lblTMMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTMMBFrameWidth.text = self.wText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.wText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblTMMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblTMMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTMMBFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.wText
            
            self.lblTMMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTMMTFrameWidth.text = self.wText
            
            //self.lblTMMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTMMBFrameWidth.text = self.wText
        }
//        self.drawArea2.addSubview(yourLabel)
    }
    
    func addLabels2Middle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.hText
                
                self.lblTMMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTMMLFrameHeight.text = self.hText
                
                //self.lblTMMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTMMRFrameHeight.text = self.hText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.hText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblTMMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblTMMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTMMRFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.hText
            
            self.lblTMMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTMMLFrameHeight.text = self.hText
            
            //self.lblTMMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTMMRFrameHeight.text = self.hText
        }
        //lblTMMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblTMMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea2.addSubview(yourLabel)
        if isFirstTimeFrame1{
            let point = CGSize(width: self.lblTMMLFrameHeight.frame.height , height: self.lblTMMLFrameHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTMMLFrameHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblTMMRFrameHeight.frame.height , height: self.lblTMMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblTMMRFrameHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
            isFirstTimeFrame1 = false
        }

    }
    
    func addLabels3Middle(_ rect:CGRect){
        let orig = rect.origin
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.textAlignment = .center
        labelBottom.text = "MIDDLE MAT"
        labelBottom.textColor = UIColor(hexString: "#544F43")
        
        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(25))
        labelBottom.center = CGPoint(x: frameRect.midX, y: rect.maxY + 35);
//        self.drawArea2.addSubview(labelBottom)
        
    }
}

// Bottom Mat *******************************

extension TripleMatResultViewController{
    func drawShapeBottom() {
        
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 30
        layer.strokeColor = self.border.cgColor
        
        //        drawArea.addSubview(rectView)
//        drawArea3.layer.addSublayer(layer)
        
        self.TBMFrameView.backgroundColor = self.border
        self.addLabelsBottom(frameRect)
        self.addLabels2Bottom(frameRect)
        self.addLabels3Bottom(frameRect)
    }
    
    func addLabelsBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                yourLabel.textAlignment = NSTextAlignment.center
                yourLabel.text = self.wText
                
                self.lblTBMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTBMTFrameWidth.text = self.wText
                
                //self.lblTBMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTBMBFrameWidth.text = self.wText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.wText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblTBMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblTBMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTBMBFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.wText
            
            self.lblTBMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTBMTFrameWidth.text = self.wText
            
            //self.lblTBMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTBMBFrameWidth.text = self.wText
        }
//        self.drawArea3.addSubview(yourLabel)
    }
    
    func addLabels2Bottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.hText
                
                self.lblTBMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTBMLFrameHeight.text = self.hText
                
                //self.lblTBMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTBMRFrameHeight.text = self.hText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.hText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblTBMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblTBMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTBMRFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.hText
            
            self.lblTBMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTBMLFrameHeight.text = self.hText
            
            //self.lblTBMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTBMRFrameHeight.text = self.hText
        }
        //lblTBMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblTBMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea3.addSubview(yourLabel)
        if isFirstTimeFrame2{
            let point = CGSize(width: self.lblTBMLFrameHeight.frame.height , height: self.lblTBMLFrameHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTBMLFrameHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblTBMRFrameHeight.frame.height , height: self.lblTBMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblTBMRFrameHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
            isFirstTimeFrame2 = false
        }

    }
    
    func addLabels3Bottom(_ rect:CGRect){
        let orig = rect.origin
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.textAlignment = .center
        labelBottom.text = "BOTTOM MAT"
        labelBottom.textColor = UIColor(hexString: "#544F43")
        
        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(25))
        labelBottom.center = CGPoint(x: frameRect.midX, y: rect.maxY + 35);
//        self.drawArea3.addSubview(labelBottom)
        
    }
}

class TripleMatResultViewController: UITableViewController {
    
    // MARK: - Varibles
    
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBOutlet weak var unitSelector: UISwitch!
    
    var matState : Int!
    
    
    var h : Double!
    var w : Double!
    var iWidth : Double!
    var iHeight : Double!
    var frameWidth: Double!
    var frameHeight: Double!
    var border: UIColor!
    
    var frameRect : CGRect!
    var imageRect : CGRect!
    var topMatW : Double = 0.0
    var topMatH : Double = 0.0
    var middleMatW : Double = 0.0
    var middleMatH : Double = 0.0
    var bottomMatW : Double = 0.0
    var bottomMatH : Double = 0.0
    
    var doubleBottom : Double = 0.0
    var tripleMiddle : Double = 0.0
    var tripleBottom : Double = 0.0
    
    var oLap: Double!
    var actualImageHeight : Double!
    var actualImageWidth : Double!
    
    var hText = ""
    var wText = ""
    var imageHText = ""
    var imageWText = ""
    var topT = ""
    var botT = ""
    var leftT = ""
    var rightT = ""
    
    var button: UIButton!

    @IBOutlet weak var drawArea: UIView!
    @IBOutlet weak var drawArea2: UIView!
    @IBOutlet weak var drawArea3: UIView!
    
   // @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var lblTTMTFrameWidth: UILabel!
    @IBOutlet weak var lblTTMBFrameWidth: UILabel!
    @IBOutlet weak var lblTTMLFrameHeight: UILabel!
    @IBOutlet weak var lblTTMRFrameHeight: UILabel!
    @IBOutlet weak var lblTTMTImageWidth: UILabel!
    @IBOutlet weak var lblTTMBImageWidth: UILabel!
    @IBOutlet weak var lblTTMLImageHeight: UILabel!
    @IBOutlet weak var lblTTMRImageHeight: UILabel!
    @IBOutlet weak var lblTTMTOWidth: UILabel!
    @IBOutlet weak var lblTTMBOWidth: UILabel!
    @IBOutlet weak var lblTTMLOHeight: UILabel!
    @IBOutlet weak var lblTTMROHeight: UILabel!
    
    @IBOutlet weak var TTMFrameView: UIView!
    @IBOutlet weak var TTMImageView: UIView!
    @IBOutlet weak var TTMOverlapView: UIView!
    
    @IBOutlet weak var lblTMMTFrameWidth: UILabel!
    @IBOutlet weak var lblTMMBFrameWidth: UILabel!
    @IBOutlet weak var lblTMMLFrameHeight: UILabel!
    @IBOutlet weak var lblTMMRFrameHeight: UILabel!
    @IBOutlet weak var lblTMMTImageWidth: UILabel!
    @IBOutlet weak var lblTMMBImageWidth: UILabel!
    @IBOutlet weak var lblTMMLImageHeight: UILabel!
    @IBOutlet weak var lblTMMRImageHeight: UILabel!
    @IBOutlet weak var lblTMMTOWidth: UILabel!
    @IBOutlet weak var lblTMMBOWidth: UILabel!
    @IBOutlet weak var lblTMMLOHeight: UILabel!
    @IBOutlet weak var lblTMMROHeight: UILabel!
    
    @IBOutlet weak var TMMFrameView: UIView!
    @IBOutlet weak var TMMImageView: UIView!
    @IBOutlet weak var TMMOverlapView: UIView!
    
    @IBOutlet weak var lblTBMTFrameWidth: UILabel!
    @IBOutlet weak var lblTBMBFrameWidth: UILabel!
    @IBOutlet weak var lblTBMLFrameHeight: UILabel!
    @IBOutlet weak var lblTBMRFrameHeight: UILabel!
    @IBOutlet weak var lblTBMTImageWidth: UILabel!
    @IBOutlet weak var lblTBMBImageWidth: UILabel!
    @IBOutlet weak var lblTBMLImageHeight: UILabel!
    @IBOutlet weak var lblTBMRImageHeight: UILabel!
    @IBOutlet weak var lblTBMTOWidth: UILabel!
    @IBOutlet weak var lblTBMBOWidth: UILabel!
    @IBOutlet weak var lblTBMLOHeight: UILabel!
    @IBOutlet weak var lblTBMROHeight: UILabel!
    
    @IBOutlet weak var TBMFrameView: UIView!
    @IBOutlet weak var TBMImageView: UIView!
    @IBOutlet weak var TBMOverlapView: UIView!
    
    var isFirstTimeImage = true
    var isFirstTimeOlapLeft = true
    var isFirstTimeOlapRight = true
    var isFirstTimeFrame = true
    
    var isFirstTimeImage1 = true
    var isFirstTimeOlapLeft1 = true
    var isFirstTimeOlapRight1 = true
    var isFirstTimeFrame1 = true
    
    var isFirstTimeImage2 = true
    var isFirstTimeOlapLeft2 = true
    var isFirstTimeOlapRight2 = true
    var isFirstTimeFrame2 = true
    
    typealias Rational = (num : Int, den : Int)
    
    // MARK: - Functions
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        setUnitSwitch()
        
//        if self.drawArea.layer.sublayers != nil{
//            for layer in self.drawArea.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        
        drawArrow()

        setLabels()
        drawShape()
        drawImgShape()
        drawOverLaps()
        
        
        // Middle Mat
        
        
//        if self.drawArea2.layer.sublayers != nil{
//            for layer in self.drawArea2.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        setLabelsMiddle()
        drawShapeMiddle()
        drawImgShapeMiddle()
        drawOverLapsMiddle()
        
        
        // Bottom Mat
        
        
//        if self.drawArea3.layer.sublayers != nil{
//            for layer in self.drawArea3.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        setLabelsBottom()
        drawShapeBottom()
        drawImgShapeBottom()
        drawOverLapsBottom()
        
        //scrollView.delegate = self
    }
    
    @objc func toCustomize(){
        self.performSegue(withIdentifier: "toCustomize", sender: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "RESULTS"
        self.navigationController?.setNavigationBarHidden(false, animated:
            false)
        if UI_USER_INTERFACE_IDIOM() == .pad{
            unitSelector.transform = CGAffineTransform.init(scaleX: 2.0, y: 1.5)
        }
    }
    
    
    
    @IBAction func unitChanged(_ sender: Any) {
        setUnitSwitch()
//        if self.drawArea.layer.sublayers != nil{
//            for layer in self.drawArea.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        setLabels()
        drawShape()
        drawImgShape()
        drawOverLaps()
        

        
        //Middle MAt
//        if self.drawArea2.layer.sublayers != nil{
//            for layer in self.drawArea2.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        setLabelsMiddle()
        drawShapeMiddle()
        drawImgShapeMiddle()
        drawOverLapsMiddle()
        
        
        // Bottom Mat
        
        
//        if self.drawArea3.layer.sublayers != nil{
//            for layer in self.drawArea3.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        setLabelsBottom()
        drawShapeBottom()
        drawImgShapeBottom()
        drawOverLapsBottom()
        
        
    }
    
    func drawArrow(){
        
        let image = UIImage(named: "ic_down_arrow.png") as UIImage?
        button   = UIButton(type: UIButtonType.custom) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.center = CGPoint(x: frameRect.maxX - 10, y: self.view.bounds.height - 50)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.btnTouched(sender:)), for: .touchUpInside)
        button.tag = 0
        //self.view.addSubview(button)
    }
    
    @objc func btnTouched(sender :UIButton){
        print("touched")
        

        
        let image = UIImage(named: "ic_down_arrow.png") as UIImage?
        
        if(sender.tag == 0){
            self.tableView.scrollToRow(at: IndexPath.init(row: 1, section: 0), at: .middle, animated: true)
            sender.tag = 1
        }
        else if(sender.tag == 1){
            self.tableView.scrollToRow(at: IndexPath.init(row: 2, section: 0), at: .bottom, animated: true)
            sender.tag = 2
        }
            
        else if(sender.tag == 2){
            self.tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
            sender.tag = 0
        }
    
        else {
            //let bottomOffset = CGPoint(x: 0, y: 0)
            //scrollView.setContentOffset(bottomOffset, animated: true)
        }
        
    }
    @IBAction func topArrowBtnPressed(_ sender: Any){
        self.tableView.scrollToRow(at: IndexPath.init(row: 2, section: 0), at: .bottom, animated: true)
    }
    @IBAction func middleArrowBtnPressed(_ sender: Any){
        self.tableView.scrollToRow(at: IndexPath.init(row: 3, section: 0), at: .bottom, animated: true)
    }
    @IBAction func bottomArrowBtnPressed(_ sender: Any){
        self.tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
    }
    
    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        var scrollViewHeight = scrollView.frame.size.height;
//        var scrollContentSizeHeight = scrollView.contentSize.height;
//        var scrollOffset = scrollView.contentOffset.y;
//
//
////        print("Scroll offset \(scrollOffset)")
//
//        if (scrollOffset <= 100)
//        {
//            // then we are at the top
//            let image = UIImage(named: "ic_down_arrow.png") as UIImage?
//            button.setImage(image, for: .normal)
//        }
//        else if (scrollOffset + scrollViewHeight == scrollContentSizeHeight || scrollOffset + scrollViewHeight >= scrollContentSizeHeight - 299)
//        {
//            // then we are at the end
//            let image = UIImage(named: "ic_up_arrow.png") as UIImage?
//            button.setImage(image, for: .normal)
//        }
//    }
//
    
    
    func setUnitSwitch(){
        if ViewController.state.useInches{
            if unitSelector.isOn {
                unitLabel.text = "DECIMAL"
            }
            else{
                unitLabel.text = "FRACTIONS"
            }
        }
        else{
            if unitSelector.isOn {
                unitLabel.text = "METERS"
            }
            else{
                unitLabel.text = "CENTIMETERS"
            }
        }
    }
    
    @objc func goBackOnDone(){    self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextController = segue.destination as? CustomizationTripleViewController{
            nextController.unitState = self.unitSelector.isOn
            nextController.matState = self.matState
            nextController.border = border
            nextController.colorTop = border
            nextController.oLap = self.oLap
            nextController.doubleBottom = self.doubleBottom
            nextController.tripleMiddle = self.tripleMiddle
            nextController.tripleBottom = self.tripleBottom
            
            nextController.frameRect = self.frameRect
            nextController.imageRect = self.imageRect
            nextController.actualImageHeight = self.actualImageHeight
            nextController.actualImageWidth = self.actualImageWidth
            nextController.frameHeight = frameHeight
            nextController.frameWidth = frameWidth
            
            nextController.SMH = hText
            nextController.SMW = wText
            nextController.DMW = imageWText
            nextController.DMH = imageHText
            nextController.TMW = imageWText
            nextController.TMH = imageHText
            nextController.firstShow = 0
        }
    }
    
    
}

// *************** TOP MAT ************

extension TripleMatResultViewController{
    
    func setLabels(){
        if ViewController.state.useInches{
            let heightInInches = frameHeight/72
            let widthInInches = frameWidth / 72
            let imgHInInches = iHeight / 72
            let imgWInInches = iWidth / 72
            let newH = (h / 72)
            let newW = (w / 72)
            
            let heightSt = String(newH)
            let widthSt = String(newW)
            var x: String!
            var v: String!
            
            
            
            if(heightSt.contains(".")){
                let hArray = heightSt.characters.split{$0 == "."}.map(String.init)
                let part1 = hArray[0] // First
                let part2 = "0." + hArray[1] // Last
                let res = rationalApproximationOf(x0: Double(part2)!)
                let c = String("\(res.num)/\(res.den)")
                
                if(c == "0/1"){
                    v = part1;
                }
                else if part1 == "0"{
                    v = c;
                }
                else{
                    v = part1 + " " + c;
                }
                
            }
            
            if(heightSt.contains(".")){
                let wArray = widthSt.characters.split{$0 == "."}.map(String.init)
                let part1 = wArray[0] // First
                let part2 = "0." + wArray[1] // Last
                let res = rationalApproximationOf(x0: Double(part2)!)
                let c = String("\(res.num)/\(res.den)")
                
                if(c == "0/1"){
                    x = part1;
                }
                else if part1 == "0"{
                    x = c;
                }
                else{
                    x = part1 + " " + c;
                }
                
            }
            
            
            
            
            
            if !unitSelector.isOn{ //Fractions
                
                var n = floor(heightInInches)
                var whole = Int(n)
                
                let remaind = heightInInches - n
                var fract = rationalApproximationOf(x0: remaind)
                
                if fract.num == 0 {
                    hText = "\(whole) ″"
                }
                else if whole == 0{
                    hText = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    hText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                n = floor(widthInInches)
                whole = Int(n)
                let remaind2 = widthInInches - n
                fract = rationalApproximationOf(x0: remaind2)
                if fract.num == 0 {
                    wText = "\(whole) ″"
                }
                else if whole == 0{
                    wText = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    wText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                n = floor(imgHInInches)
                whole = Int(n)
                let remaind3 = imgHInInches - n
                fract = rationalApproximationOf(x0: remaind3)
                
                if fract.num == 0 {
                    imageHText = "\(whole) ″"
                }
                else if whole == 0{
                    imageHText = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    imageHText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                n = floor(imgWInInches)
                whole = Int(n)
                let remaind4 = imgWInInches - n
                fract = rationalApproximationOf(x0: remaind4)
                if fract.num == 0 {
                    imageWText = "\(whole) ″"
                }
                else if whole == 0{
                    imageWText = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    imageWText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                topT = "\(v!) ″";
                botT = "\(v!) ″";
                leftT = "\(x!) ″"
                rightT = "\(x!) ″"
                
            }
            else {
                hText = "\(round(heightInInches * 100)/100)in"
                wText = "\(round(widthInInches * 100)/100)in"
                imageHText = "\(round(imgHInInches * 100)/100)in"
                imageWText = "\(round(imgWInInches * 100)/100)in"
                topT = "\(newH)in";
                botT = "\(newH)in";
                leftT = "\(newW)in"
                rightT = "\(newW)in"
            }
        }
        else{
            var heightInInches = frameHeight/28
            var widthInInches = frameWidth / 28
            var imgHInInches = iHeight / 28
            var imgWInInches = iWidth / 28
            let newH = (h / 28)
            let newW = (w / 28)
            
            
            if !unitSelector.isOn{//CentiMeters
                
                hText = "\(round(heightInInches * 100)/100)cm"
                wText = "\(round(widthInInches * 100)/100)cm"
                imageHText = "\(round(imgHInInches * 100)/100)cm"
                imageWText = "\(round(imgWInInches * 100)/100)cm"
                topT = "\(round(newH * 100)/100)cm"
                botT = "\(round(newH * 100)/100)cm"
                leftT = "\(round(newW * 100)/100)cm"
                rightT = "\(round(newW * 100)/100)cm"
            }
            else{
                heightInInches /= 100
                widthInInches /= 100
                imgHInInches /= 100
                imgWInInches /= 100
                
                hText = "\(round(heightInInches * 100)/100)m"
                wText = "\(round(widthInInches * 100)/100)m"
                imageHText = "\(round(imgHInInches * 100)/100)m"
                imageWText = "\(round(imgWInInches * 100)/100)m"
                topT = "\(round(newH * 100)/100)m"
                botT = "\(round(newH * 100)/100)m"
                leftT = "\(round(newW * 100)/100)m"
                rightT = "\(round(newW * 100)/100)m"
            }
        }
    }
    
    func drawImgShape() {
        
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.imageRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 25
        layer.strokeColor = self.border.cgColor
//        self.drawArea.layer.addSublayer(layer)
        
        self.TTMImageView.backgroundColor = self.border
        self.addImgLabels(imageRect)
        self.addImgLabels2(imageRect)
        
    }
    
    
    func addImgLabels(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = imageWText
                
                self.lblTTMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                
                self.lblTTMTImageWidth.text = imageWText
                
                //self.lblTTMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                
                //self.lblTTMBImageWidth.text = imageWText

            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageWText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblTTMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblTTMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTTMBImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
            
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageWText
            
            self.lblTTMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            
            self.lblTTMTImageWidth.text = imageWText
            
            //self.lblTTMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            
            //self.lblTTMBImageWidth.text = imageWText
        }
//        self.drawArea.addSubview(yourLabel)
    }
    
    func addImgLabels2(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = imageHText
                
                self.lblTTMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTTMLImageHeight.text = imageHText
                
                //self.lblTTMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTTMRImageHeight.text = imageHText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageHText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTTMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblTTMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTTMRImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageHText
            
            self.lblTTMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTTMLImageHeight.text = imageHText
            
            //self.lblTTMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTTMRImageHeight.text = imageHText
        }
        //lblTTMLImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblTTMRImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
        if isFirstTimeImage{
            let point = CGSize(width: self.lblTTMLImageHeight.frame.height , height: self.lblTTMLImageHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTTMLImageHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblTTMRImageHeight.frame.height , height: self.lblTTMRImageHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblTTMRImageHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
            isFirstTimeImage = false
        }

    }
    func drawOverLaps() {
        
        let imgRect = makeRandomRectangle()
        
        self.addTop(imgRect)
        self.addLeft(imgRect)
        self.addBottom(imgRect)
        self.addRight(imgRect)
    }
    
    func makeRandomRectangle() -> CGRect{
        
        //        let w = Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1 - 15) % Int(self.drawArea.bounds.width)
        //
        //        let h = ( Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1) - 15) % Int(self.drawArea.bounds.width)
        
        let w = frameRect.width - 50
        let h = frameRect.height - 50
        
        
        //        let w = round(imgWidth * 100) / 100
        //        let h = round(imgHeight * 100) / 100
        
        
        
        let size = CGSize(width: w, height: h)
        let origin =  CGPoint(x: self.frameRect.midX - (size.width / 2), y: self.frameRect.midY - (size.height / 2))
        
        return CGRect(origin: origin, size: size)
    }
    
    func addTop(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = topT
                
                self.lblTTMTOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTTMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblTTMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblTTMTOWidth.text = topT
        }
//        self.drawArea.addSubview(yourLabel)
    }
    
    func addBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15 + rect.height, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = topT
                
                self.lblTTMBOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTTMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblTTMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblTTMBOWidth.text = topT
        }
//        self.drawArea.addSubview(yourLabel)
    }
    
    func addLeft(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = leftT
                
                self.lblTTMLOHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTTMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblTTMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblTTMLOHeight.text = leftT
        }
        //lblTTMLOHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
        if isFirstTimeOlapLeft{
            let point = CGSize(width: self.lblTTMLOHeight.frame.height , height: self.lblTTMLOHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTTMLOHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            isFirstTimeOlapLeft = false
        }

        

    }
    
    func addRight(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.maxX - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = leftT
                
                self.lblTTMROHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTTMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblTTMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblTTMROHeight.text = leftT
        }
        //lblTTMROHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
        if isFirstTimeOlapRight{
            let point = CGSize(width: self.lblTTMROHeight.frame.height , height: self.lblTTMROHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTTMROHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            
            isFirstTimeOlapRight = false
        }
        
        

    }
    
    
}

// Middle Mat *************************************


extension TripleMatResultViewController{
    
    func setLabelsMiddle(){
        if ViewController.state.useInches{
            let heightInInches = frameHeight/72
            let widthInInches = frameWidth / 72
            let imgHInInches = iHeight / 72 - ((tripleMiddle*2) / 72)
            let imgWInInches = iWidth / 72 - ((tripleMiddle*2) / 72)
            let newH = (h / 72) + (tripleMiddle / 72)
            let newW = (w / 72) + (tripleMiddle / 72)
            
            let heightSt = String(newH)
            let widthSt = String(newW)
            var x: String!
            var v: String!
            
            
            
            if(heightSt.contains(".")){
                let hArray = heightSt.characters.split{$0 == "."}.map(String.init)
                let part1 = hArray[0] // First
                let part2 = "0." + hArray[1] // Last
                let res = rationalApproximationOf(x0: Double(part2)!)
                let c = String("\(res.num)/\(res.den)")
                
                if(c == "0/1"){
                    v = part1;
                }
                else {
                    v = part1 + " " + c;
                }
                
            }
            
            if(heightSt.contains(".")){
                let wArray = widthSt.characters.split{$0 == "."}.map(String.init)
                let part1 = wArray[0] // First
                let part2 = "0." + wArray[1] // Last
                let res = rationalApproximationOf(x0: Double(part2)!)
                let c = String("\(res.num)/\(res.den)")
                
                if(c == "0/1"){
                    x = part1;
                }
                else {
                    x = part1 + " " + c;
                }
                
            }
            
            
            
            
            
            if !unitSelector.isOn{ //Fractions
                
                var n = floor(heightInInches)
                var whole = Int(n)
                let remaind = heightInInches - n
                var fract = rationalApproximationOf(x0: remaind)
                
                if fract.num == 0 {
                    hText = "\(whole) ″"
                }
                else{
                    hText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                n = floor(widthInInches)
                whole = Int(n)
                let remaind2 = widthInInches - n
                fract = rationalApproximationOf(x0: remaind2)
                if fract.num == 0 {
                    wText = "\(whole) ″"
                }
                else{
                    wText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                n = floor(imgHInInches)
                whole = Int(n)
                let remaind3 = imgHInInches - n
                fract = rationalApproximationOf(x0: remaind3)
                
                if fract.num == 0 {
                    imageHText = "\(whole) ″"
                }
                else{
                    imageHText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                n = floor(imgWInInches)
                whole = Int(n)
                
                let remaind4 = imgWInInches - n
                fract = rationalApproximationOf(x0: remaind4)
                if fract.num == 0 {
                    imageWText = "\(whole) ″"
                }
                else{
                    imageWText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                topT = "\(v!) ″";
                botT = "\(v!) ″";
                leftT = "\(x!) ″"
                rightT = "\(x!) ″"
                
            }
            else {
                hText = "\(round(heightInInches * 100)/100)in"
                wText = "\(round(widthInInches * 100)/100)in"
                imageHText = "\(round(imgHInInches * 100)/100)in"
                imageWText = "\(round(imgWInInches * 100)/100)in"
                topT = "\(newH)in";
                botT = "\(newH)in";
                leftT = "\(newW)in"
                rightT = "\(newW)in"
            }
        }
        else{
            var heightInInches = frameHeight/28
            var widthInInches = frameWidth / 28
            var imgHInInches = iHeight / 28
            var imgWInInches = iWidth / 28
            let newH = (h / 28)
            let newW = (w / 28)
            
            
            
            if !unitSelector.isOn{//CentiMeters
                
                hText = "\(round(heightInInches * 100)/100)cm"
                wText = "\(round(widthInInches * 100)/100)cm"
                imageHText = "\(round(imgHInInches * 100)/100)cm"
                imageWText = "\(round(imgWInInches * 100)/100)cm"
                topT = "\(round(newH * 100)/100)cm"
                botT = "\(round(newH * 100)/100)cm"
                leftT = "\(round(newW * 100)/100)cm"
                rightT = "\(round(newW * 100)/100)cm"
            }
            else{
                heightInInches /= 100
                widthInInches /= 100
                imgHInInches /= 100
                imgWInInches /= 100
                
                hText = "\(round(heightInInches * 100)/100)m"
                wText = "\(round(widthInInches * 100)/100)m"
                imageHText = "\(round(imgHInInches * 100)/100)m"
                imageWText = "\(round(imgWInInches * 100)/100)m"
                topT = "\(round(newH * 100)/100)m"
                botT = "\(round(newH * 100)/100)m"
                leftT = "\(round(newW * 100)/100)m"
                rightT = "\(round(newW * 100)/100)m"
            }
        }
    }
    
    func drawImgShapeMiddle() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.imageRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 25
        layer.strokeColor = self.border.cgColor
//        self.drawArea2.layer.addSublayer(layer)
        
        self.TMMImageView.backgroundColor = self.border
        self.addImgLabelsMiddle(imageRect)
        self.addImgLabels2Middle(imageRect)
        
    }
    
    
    func addImgLabelsMiddle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = imageWText
                
                self.lblTMMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTMMTImageWidth.text = imageWText
                
                //self.lblTMMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTMMBImageWidth.text = imageWText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageWText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblTMMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTMMBImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageWText
            
            self.lblTMMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTMMTImageWidth.text = imageWText
            
            //self.lblTMMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTMMBImageWidth.text = imageWText
        }
//        self.drawArea2.addSubview(yourLabel)
    }
    
    func addImgLabels2Middle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = imageHText
                
                self.lblTMMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTMMLImageHeight.text = imageHText
                
                //self.lblTMMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTMMRImageHeight.text = imageHText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageHText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblTMMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTMMRImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageHText
            
            self.lblTMMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTMMLImageHeight.text = imageHText
            
            //self.lblTMMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTMMRImageHeight.text = imageHText
        }
        //lblTMMLImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblTMMRImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea2.addSubview(yourLabel)
        if isFirstTimeImage1{
            let point = CGSize(width: self.lblTMMLImageHeight.frame.height , height: self.lblTMMLImageHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTMMLImageHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblTMMRImageHeight.frame.height , height: self.lblTMMRImageHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblTMMRImageHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
            isFirstTimeImage1 = false
        }

    }
    func drawOverLapsMiddle() {
        
        let imgRect = makeRandomRectangle()
        
        self.addTopMiddle(imgRect)
        self.addLeftMiddle(imgRect)
        self.addBottomMiddle(imgRect)
        self.addRightMiddle(imgRect)
    }
    
    func makeRandomRectangleMiddle() -> CGRect{
        
        //        let w = Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1 - 15) % Int(self.drawArea.bounds.width)
        //
        //        let h = ( Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1) - 15) % Int(self.drawArea.bounds.width)
        
        let w = frameRect.width - 50
        let h = frameRect.height - 50
        
        
        //        let w = round(imgWidth * 100) / 100
        //        let h = round(imgHeight * 100) / 100
        
        
        
        let size = CGSize(width: w, height: h)
        let origin =  CGPoint(x: self.frameRect.midX - (size.width / 2), y: self.frameRect.midY - (size.height / 2))
        
        return CGRect(origin: origin, size: size)
    }
    
    func addTopMiddle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = topT
                
                self.lblTMMTOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblTMMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblTMMTOWidth.text = topT
        }
//        self.drawArea2.addSubview(yourLabel)
    }
    
    func addBottomMiddle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15 + rect.height, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = topT
                
                self.lblTMMBOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblTMMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblTMMBOWidth.text = topT
        }
//        self.drawArea2.addSubview(yourLabel)
    }
    
    func addLeftMiddle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = leftT
                
                self.lblTMMLOHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblTMMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblTMMLOHeight.text = leftT
        }
        //lblTMMLOHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea2.addSubview(yourLabel)
        if isFirstTimeOlapLeft1{
            let point = CGSize(width: self.lblTMMLOHeight.frame.height , height: self.lblTMMLOHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTMMLOHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            isFirstTimeOlapLeft1 = false
        }
        
        
    }
    
    func addRightMiddle(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.maxX - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = leftT
                
                self.lblTMMROHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblTMMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblTMMROHeight.text = leftT
        }
        //lblTMMROHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea2.addSubview(yourLabel)
        if isFirstTimeOlapRight1{
            let point = CGSize(width: self.lblTMMROHeight.frame.height , height: self.lblTMMROHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTMMROHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            isFirstTimeOlapRight1 = false
        }
        
        
    }
    
    
}

// Bottom Mat *************************************


extension TripleMatResultViewController{
    
    func setLabelsBottom(){
        if ViewController.state.useInches{
            let heightInInches = frameHeight/72
            let widthInInches = frameWidth / 72
            let imgHInInches = (iHeight / 72 - ((tripleMiddle*2) / 72) - tripleBottom / 72)
            let imgWInInches = (iWidth / 72 - ((tripleMiddle*2) / 72) - tripleBottom / 72)
            let newH = (h / 72) + ((tripleMiddle+tripleBottom) / 72)
            let newW = (w / 72) + ((tripleMiddle+tripleBottom) / 72)
            
            let heightSt = String(newH)
            let widthSt = String(newW)
            var x: String!
            var v: String!
            
            
            
            if(heightSt.contains(".")){
                let hArray = heightSt.characters.split{$0 == "."}.map(String.init)
                let part1 = hArray[0] // First
                let part2 = "0." + hArray[1] // Last
                let res = rationalApproximationOf(x0: Double(part2)!)
                let c = String("\(res.num)/\(res.den)")
                
                if(c == "0/1"){
                    v = part1;
                }
                else {
                    v = part1 + " " + c;
                }
                
            }
            
            if(heightSt.contains(".")){
                let wArray = widthSt.characters.split{$0 == "."}.map(String.init)
                let part1 = wArray[0] // First
                let part2 = "0." + wArray[1] // Last
                let res = rationalApproximationOf(x0: Double(part2)!)
                let c = String("\(res.num)/\(res.den)")
                
                if(c == "0/1"){
                    x = part1;
                }
                else {
                    x = part1 + " " + c;
                }
                
            }
            
            
            
            
            
            if !unitSelector.isOn{ //Fractions
                
                var n = floor(heightInInches)
                var whole = Int(n)
                
                let remaind3 = heightInInches - n
                var fract = rationalApproximationOf(x0: remaind3)
                
                if fract.num == 0 {
                    hText = "\(whole) ″"
                }
                else{
                    hText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                n = floor(widthInInches)
                whole = Int(n)
                
                let remaind4 = widthInInches - n
                fract = rationalApproximationOf(x0: remaind4)
                if fract.num == 0 {
                    wText = "\(whole) ″"
                }
                else{
                    wText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                n = floor(imgHInInches)
                whole = Int(n)
                let remaind = imgHInInches - n
                fract = rationalApproximationOf(x0: remaind)
                
                if fract.num == 0 {
                    imageHText = "\(whole) ″"
                }
                else{
                    imageHText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                n = floor(imgWInInches)
                whole = Int(n)
                let remaind2 = imgWInInches - n
                fract = rationalApproximationOf(x0: remaind2)
                if fract.num == 0 {
                    imageWText = "\(whole) ″"
                }
                else{
                    imageWText = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                topT = "\(v!) ″"
                botT = "\(v!) ″"
                leftT = "\(x!) ″"
                rightT = "\(x!) ″"
                
            }
            else {
                hText = "\(round(heightInInches * 100)/100)in"
                wText = "\(round(widthInInches * 100)/100)in"
                imageHText = "\(round(imgHInInches * 100)/100)in"
                imageWText = "\(round(imgWInInches * 100)/100)in"
                topT = "\(newH)in";
                botT = "\(newH)in";
                leftT = "\(newW)in"
                rightT = "\(newW)in"
            }
        }
        else{
            var heightInInches = frameHeight/28
            var widthInInches = frameWidth / 28
            var imgHInInches = iHeight / 28
            var imgWInInches = iWidth / 28
            let newH = (h / 28)
            let newW = (w / 28)
            
            
            
            if !unitSelector.isOn{//CentiMeters
                
                hText = "\(round(heightInInches * 100)/100)cm"
                wText = "\(round(widthInInches * 100)/100)cm"
                imageHText = "\(round(imgHInInches * 100)/100)cm"
                imageWText = "\(round(imgWInInches * 100)/100)cm"
                topT = "\(round(newH * 100)/100)cm"
                botT = "\(round(newH * 100)/100)cm"
                leftT = "\(round(newW * 100)/100)cm"
                rightT = "\(round(newW * 100)/100)cm"
            }
            else{
                heightInInches /= 100
                widthInInches /= 100
                imgHInInches /= 100
                imgWInInches /= 100
                
                hText = "\(round(heightInInches * 100)/100)m"
                wText = "\(round(widthInInches * 100)/100)m"
                imageHText = "\(round(imgHInInches * 100)/100)m"
                imageWText = "\(round(imgWInInches * 100)/100)m"
                topT = "\(round(newH * 100)/100)m"
                botT = "\(round(newH * 100)/100)m"
                leftT = "\(round(newW * 100)/100)m"
                rightT = "\(round(newW * 100)/100)m"
            }
        }
    }
    
    func drawImgShapeBottom() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.imageRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 25
        layer.strokeColor = self.border.cgColor
//        self.drawArea3.layer.addSublayer(layer)
        
        self.TBMImageView.backgroundColor = self.border
        self.addImgLabelsBottom(imageRect)
        self.addImgLabels2Bottom(imageRect)
        
    }
    
    
    func addImgLabelsBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = imageWText
                
                self.lblTBMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTBMTImageWidth.text = imageWText
                
                //self.lblTBMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTBMBImageWidth.text = imageWText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageWText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTBMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblTBMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTBMBImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageWText
            
            self.lblTBMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTBMTImageWidth.text = imageWText
            
            //self.lblTBMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTBMBImageWidth.text = imageWText
        }
//        self.drawArea3.addSubview(yourLabel)
    }
    
    func addImgLabels2Bottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = imageHText
                
                self.lblTBMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblTBMLImageHeight.text = imageHText
                
                //self.lblTBMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblTBMRImageHeight.text = imageHText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageHText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTBMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblTBMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblTBMRImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageHText
            
            self.lblTBMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblTBMLImageHeight.text = imageHText
            
            //self.lblTBMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblTBMRImageHeight.text = imageHText
        }
        //lblTBMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblTBMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea3.addSubview(yourLabel)
        if isFirstTimeImage2{
            let point = CGSize(width: self.lblTBMLImageHeight.frame.height , height: self.lblTBMLImageHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTBMLImageHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblTBMRImageHeight.frame.height , height: self.lblTBMRImageHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblTBMRImageHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
            isFirstTimeImage2 = false
        }

    }
    func drawOverLapsBottom() {
        
        let imgRect = makeRandomRectangle()
        
        self.addTopBottom(imgRect)
        self.addLeftBottom(imgRect)
        self.addBottomBottom(imgRect)
        self.addRightBottom(imgRect)
    }
    
    func makeRandomRectangleBottom() -> CGRect{
        
        let w = frameRect.width - 50
        let h = frameRect.height - 50
        
        let size = CGSize(width: w, height: h)
        let origin =  CGPoint(x: self.frameRect.midX - (size.width / 2), y: self.frameRect.midY - (size.height / 2))
        
        return CGRect(origin: origin, size: size)
    }
    
    func addTopBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = topT
                
                self.lblTBMTOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTBMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblTBMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblTBMTOWidth.text = topT
        }
//        self.drawArea3.addSubview(yourLabel)
    }
    
    func addBottomBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15 + rect.height, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = topT
                
                self.lblTBMBOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTBMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblTBMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblTBMBOWidth.text = topT
        }
//        self.drawArea3.addSubview(yourLabel)
    }
    
    func addLeftBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = leftT
                
                self.lblTBMLOHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTBMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblTBMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblTBMLOHeight.text = leftT
        }
        //lblTBMLOHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea3.addSubview(yourLabel)
        if isFirstTimeOlapLeft2{
            let point = CGSize(width: self.lblTBMLOHeight.frame.height , height: self.lblTBMLOHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTBMLOHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            isFirstTimeOlapLeft2 = false
        }
        
        
    }
    
    func addRightBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.maxX - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.textColor = UIColor.red
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = leftT
                
                self.lblTBMROHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTBMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblTBMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblTBMROHeight.text = leftT
        }
        //lblTBMROHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea3.addSubview(yourLabel)
        if isFirstTimeOlapRight2{
            let point = CGSize(width: self.lblTBMROHeight.frame.height , height: self.lblTBMROHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTBMROHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            isFirstTimeOlapRight2 = false
        }
        
        

    }
    
    
}


// Navigation Bar Buttons *************************************



extension TripleMatResultViewController{
    private func setNavigationItems(){
        self.navigationItem.backBarButtonItem?.title = " "
        
        self.navigationItem.title = "RESULTS"
        self.navigationController?.setNavigationBarHidden(false, animated:
            false)
        
        self.navigationItem.hidesBackButton = true
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let navFrame = self.navigationController?.navigationBar.frame
            self.navigationController?.navigationBar.frame = CGRect(x: (navFrame?.origin.x)!, y: (navFrame?.origin.y)!, width: navFrame!.width, height: 120)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)]
            
        }
        //        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .done, target: self, action: #selector(toAddBorderScreen))
        setRightBarButton()
        setLeftBarButton()
        
    }
    
    private func setLeftBarButton(){
        
        self.navigationItem.backBarButtonItem?.title = ""
        
        if !(self.navigationItem.leftBarButtonItems?.count == 0) {
            self.navigationItem.leftBarButtonItems = nil
        }
        //        let leftbtn = UIBarButtonItem(image: #imageLiteral(resourceName: "png-Create-btn-8").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(create))
        
        let leftbtn = UIButton(type: .roundedRect)
        leftbtn.setImage(#imageLiteral(resourceName: "Done-btn").withRenderingMode(.alwaysOriginal), for: .normal)
        leftbtn.addTarget(self, action: #selector(goBackOnDone), for: .touchUpInside)
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let width = leftbtn.widthAnchor.constraint(equalToConstant: 100)
            width.isActive = true
            let height = leftbtn.heightAnchor.constraint(equalToConstant: 50)
            height.isActive = true
        }
        else{
            let width = leftbtn.widthAnchor.constraint(equalToConstant: 50)
            width.isActive = true
            let height = leftbtn.heightAnchor.constraint(equalToConstant: 25)
            height.isActive = true
        }
        
         leftbtn.contentEdgeInsets.left = 5
        
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(#imageLiteral(resourceName: "Back-btn").withRenderingMode(.alwaysOriginal), for: .normal)
        backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let w = backBtn.widthAnchor.constraint(equalToConstant: 24)
            w.isActive = true
            let h = backBtn.heightAnchor.constraint(equalToConstant: 40)
            h.isActive = true
        }
        else{
            let w = backBtn.widthAnchor.constraint(equalToConstant: 12)
            w.isActive = true
            let h = backBtn.heightAnchor.constraint(equalToConstant: 20)
            h.isActive = true
        }
        backBtn.frame.offsetBy(dx: -10, dy: 0)
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backBtn), UIBarButtonItem(customView: leftbtn)]
        
        
        
        //        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbtn)
        
        
        
        //        self.navigationItem.leftBarButtonItem = leftbtn
        
    }
    
    private func setRightBarButton(){
        
        let rightbtn = UIButton(type: .roundedRect)
        rightbtn.setImage(#imageLiteral(resourceName: "Customize-btn").withRenderingMode(.alwaysOriginal), for: .normal)
        
        rightbtn.addTarget(self, action: #selector(toCustomize), for: .touchUpInside)
        
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let width = rightbtn.widthAnchor.constraint(equalToConstant: 132)
            width.isActive = true
            let height = rightbtn.heightAnchor.constraint(equalToConstant: 50)
            height.isActive = true
        }
        else{
            let width = rightbtn.widthAnchor.constraint(equalToConstant: 66)
            width.isActive = true
            let height = rightbtn.heightAnchor.constraint(equalToConstant: 25)
            height.isActive = true
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbtn)
        
        //        self.navigationItem.leftBarButtonItem = leftbtn
    }
}

extension TripleMatResultViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let navheight = (self.navigationController?.navigationBar.frame.height)!
        if UI_USER_INTERFACE_IDIOM() == .phone{
            
            if indexPath.row == 1{
                if UIScreen.main.bounds.height <= 800{
                    
                    return UIScreen.main.bounds.height - 70 - navheight
                }
                else{
                    
                    return UIScreen.main.bounds.height - 120 - navheight
                }
                

            }
            else if indexPath.row == 2 || indexPath.row == 3{
                if UIScreen.main.bounds.height <= 800{
                    
                    return UIScreen.main.bounds.height - 20 - navheight
                }
                else{
                    
                    return UIScreen.main.bounds.height - 70 - navheight
                }
                

            }
            else{
                
                return 50
                
            }
        }
        else{
            
            if indexPath.row == 1{
                
                if UIScreen.main.bounds.height <= 1030{
                    
                    return UIScreen.main.bounds.height - 120 - navheight
                    
                }
                else{
                    
                    return UIScreen.main.bounds.height - 120 - navheight
                    
                }
                
            }
            else if indexPath.row == 2 || indexPath.row == 3{
                
                if UIScreen.main.bounds.height <= 1030{
                    
                    return UIScreen.main.bounds.height - 20 - navheight
                }
                else{
                    
                    return UIScreen.main.bounds.height - 70 - navheight
                }
                
            }
            else{
                
                return 80
                
            }
            
        }
    }
}
