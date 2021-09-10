//
//  ResultsViewController.swift
//  Framed
//
//  Created by Dr. Atta on 02/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import ChainableAnimations

extension ResultsViewController{
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
        
//        let layer = CAShapeLayer()
//        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
//        layer.fillColor = UIColor.clear.cgColor
//        layer.lineWidth = 30
//        layer.strokeColor = self.border.cgColor
        
        //        drawArea.addSubview(rectView)
        //drawArea.layer.addSublayer(layer)
        
        self.frameView.backgroundColor = self.border
        self.addLabels(frameRect)
        self.addLabels2(frameRect)
//        self.addLabelsBottom(frameRect)
    }
    
    func addLabels(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
               // yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.wText
                self.lblSMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblSMTFrameWidth.text = self.wText
                //self.lblSMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblSMBFrameWidth.text = self.wText
                
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.wText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                    //self.lblSMBFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
                    //self.lblSMBFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }

            }

        }
        else{
            //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.text = self.wText
            
            self.lblSMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMTFrameWidth.text = self.wText
            //self.lblSMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblSMBFrameWidth.text = self.wText
        }
        //self.drawArea.addSubview(yourLabel)
    }
    
    func addLabels2(_ rect:CGRect){
//        let orig = rect.origin
//        let frame = self.lblSMLFrameHeight.frame
//        let frame1 = self.lblSMRFrameHeight.frame
//        let yourLabel = UILabel(frame: CGRect(x: frame.origin.x, y: frame.origin.y , width: frame.height, height: frame.width))
//        yourLabel.backgroundColor = UIColor.clear
        
        
        if ViewController.state.useInches{
            if unitSelector.isOn{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
//                yourLabel.text = self.hText
                
                self.lblSMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                
                self.lblSMLFrameHeight.text = self.hText
                //self.lblSMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                
                //self.lblSMRFrameHeight.text = self.hText
            }
            else{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
//                yourLabel.text = self.hText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                    //self.lblSMRFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                 
                    self.lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
                    //self.lblSMRFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                
            }

        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.hText
            
            self.lblSMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMLFrameHeight.text = self.hText
            //self.lblSMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblSMRFrameHeight.text = self.hText
        }
//        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        //self.drawArea.addSubview(yourLabel)


        if isFirstTimeFrame{
            
            let point = CGSize(width: self.lblSMLFrameHeight.frame.height , height: self.lblSMLFrameHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLFrameHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            //self.lblSMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            //self.lblSMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            
            
            //let point1 = CGSize(width: self.lblSMRFrameHeight.frame.height , height: self.lblSMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblSMRFrameHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            isFirstTimeFrame = false
        }

        
        
    }
    
    func addLabelsBottom(_ rect:CGRect){
        let orig = rect.origin
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.textAlignment = .center
        labelBottom.text = "TOP MAT"
        labelBottom.textColor = UIColor(hexString: "#544F43")

        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(25))
        labelBottom.center = CGPoint(x: frameRect.midX, y: rect.maxY + 35);
        //self.drawArea.addSubview(labelBottom)
        
    }
    
}

class ResultsViewController: UITableViewController {
    
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
    
    @IBOutlet weak var lblSMTFrameWidth: UILabel!
    @IBOutlet weak var lblSMBFrameWidth: UILabel!
    @IBOutlet weak var lblSMLFrameHeight: UILabel!
    @IBOutlet weak var lblSMRFrameHeight: UILabel!
    @IBOutlet weak var lblSMTImageWidth: UILabel!
    @IBOutlet weak var lblSMBImageWidth: UILabel!
    @IBOutlet weak var lblSMLImageHeight: UILabel!
    @IBOutlet weak var lblSMRImageHeight: UILabel!
    @IBOutlet weak var lblSMTOWidth: UILabel!
    @IBOutlet weak var lblSMBOWidth: UILabel!
    @IBOutlet weak var lblSMLOHeight: UILabel!
    @IBOutlet weak var lblSMROHeight: UILabel!
    
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var overlapView: UIView!
    
    //@IBOutlet weak var drawArea: UIView!
    
    var isFirstTimeFrame = true
    var isFirstTimeOlapLeft = true
    var isFirstTimeOlapRight = true
    var isFirstTimeImage = true
    
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
        setLabels()
        drawShape()
        drawImgShape()
        drawOverLaps()
        // Do any additional setup after loading the view.
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
    
    @IBAction func unitChanged(_ sender: UISwitch) {
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

    }
    
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
        if let nextController = segue.destination as? CustomizationSingleViewController{
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


typealias Rational = (num : Int, den : Int)

func rationalApproximation(of x0 : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
    var x = x0
    var a = x.rounded(.down)
    var (h1, k1, h, k) = (1, 0, Int(a), 1)
    
    while x - a > eps * Double(k) * Double(k) {
        x = 1.0/(x - a)
        a = x.rounded(.down)
        (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
    }
    return (h, k)
}

extension ResultsViewController{
    
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
                else if(part1 == "0"){
                    
                    v =  c;
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
                else if (part1 == "0") {
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
                else if whole == 0 {
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
                else if whole == 0 {
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
                else if whole == 0 {
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
        
        //    let rect = CGRect(x: self.frameRect.midX - (imageRect.width / 2), y: self.frameRect.midY - (imageRect.height / 2), width: self.imageRect.width, height: imageRect.height)
        //
        //    self.imageRect = rect
        
        //    if imageRect.width > frameRect.width{
        //        imageRect.size.width = frameRect.width - 50
        //    }
        //
        //    if imageRect.height > frameRect.height
        //    {
        //        imageRect.size.height = frameRect.height - 50
        //    }
        //
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.imageRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 25
        layer.strokeColor = self.border.cgColor
        //self.drawArea.layer.addSublayer(layer)
        
        self.imageView.backgroundColor = self.border
        self.addImgLabels(imageRect)
        self.addImgLabels2(imageRect)
        
    }
    
    
    func addImgLabels(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageWText
                
                
                self.lblSMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblSMTImageWidth.text = imageWText
                //self.lblSMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblSMBImageWidth.text = imageWText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageWText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblSMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                    //self.lblSMBImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblSMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 30)
                    //self.lblSMBImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                
            }

        }
        else{
            //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
            //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.text = imageWText
            
            self.lblSMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMTImageWidth.text = imageWText
            //self.lblSMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblSMBImageWidth.text = imageWText
        }
        //self.drawArea.addSubview(yourLabel)
    }
    
    func addImgLabels2(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageHText
                
                self.lblSMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblSMLImageHeight.text = imageHText
                //self.lblSMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblSMRImageHeight.text = imageHText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageHText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblSMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                    //self.lblSMRImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblSMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 30)
                    //self.lblSMRImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                
            }

        }
        else{
            //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
            //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.text = imageHText
            
            self.lblSMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMLImageHeight.text = imageHText
            //self.lblSMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblSMRImageHeight.text = imageHText
        }
        //yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
//        self.lblSMLImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.lblSMRImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        if isFirstTimeImage{
            let point = CGSize(width: self.lblSMLImageHeight.frame.height , height: self.lblSMLImageHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLImageHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)

            //let point1 = CGSize(width: self.lblSMRImageHeight.frame.height , height: self.lblSMRImageHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblSMRImageHeight)
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
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                
                self.lblSMTOWidth.text = topT
                
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblSMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    
                    self.lblSMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                

            }

        }
        else{
            //yourLabel.textColor = UIColor.red
            //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.text = topT
            
            self.lblSMTOWidth.text = topT
        }
        //self.drawArea.addSubview(yourLabel)
    }
    
    func addBottom(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15 + rect.height, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                
                self.lblSMBOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblSMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    
                    self.lblSMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }

        }
        else{
            //yourLabel.textColor = UIColor.red
            //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.text = topT
            
            self.lblSMBOWidth.text = topT
        }
        //self.drawArea.addSubview(yourLabel)
    }
    
    func addLeft(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitSelector.isOn{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                
                self.lblSMLOHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                 
                    self.lblSMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    
                    self.lblSMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }

        }
        else{
            //yourLabel.textColor = UIColor.red
            //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.text = leftT
            
            self.lblSMLOHeight.text = leftT
        }
        //lblSMLOHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        if isFirstTimeOlapLeft{
            let point = CGSize(width: self.lblSMLOHeight.frame.height , height: self.lblSMLOHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLOHeight)
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
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                
                self.lblSMROHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                //yourLabel.textAlignment = NSTextAlignment.center
                //yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblSMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblSMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                    
                }
                
            }

        }
        else{
            //yourLabel.textColor = UIColor.red
            //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.text = leftT
            
            self.lblSMROHeight.text = leftT
        }
        //lblSMROHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        if isFirstTimeOlapRight{
            let point = CGSize(width: self.lblSMROHeight.frame.height , height: self.lblSMROHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMROHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            isFirstTimeOlapRight = false
        }
        
        

    }
    
    
}




extension ResultsViewController{
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

extension ResultsViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .phone{
            if indexPath.row == 1{
                let navheight = (self.navigationController?.navigationBar.frame.height)!
                
                if UIScreen.main.bounds.height <= 800{
                    return UIScreen.main.bounds.height - 70 - navheight
                }
                else{
                    return UIScreen.main.bounds.height - 120 - navheight
                }
                

            }
            else{
                return 50
            }
        }
        else{
            if indexPath.row == 1{
                let navheight = (self.navigationController?.navigationBar.frame.height)!
                if UIScreen.main.bounds.height <= 1030{
                
                    return UIScreen.main.bounds.height - 120 - navheight
                }
                else{
                    return UIScreen.main.bounds.height - 120 - navheight
                }
            }
            else{
                return 80
            }
        }

    }
}
