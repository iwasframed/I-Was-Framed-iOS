//
//  ResultsViewController.swift
//  Framed
//
//  Created by Dr. Atta on 02/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import ChainableAnimations

extension DoubleMatResultViewController{
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
        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 30
        layer.strokeColor = self.border.cgColor
        
        //        drawArea.addSubview(rectView)
        //drawArea.layer.addSublayer(layer)
        
        self.DTMFrameView.backgroundColor = self.border
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
                
                self.lblDTMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDTMTFrameWidth.text = self.wText
                
                //self.lblDTMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDTMBFrameWidth.text = self.wText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.wText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblDTMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblDTMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblDTMBFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.wText
            
            self.lblDTMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDTMTFrameWidth.text = self.wText
            
            //self.lblDTMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDTMBFrameWidth.text = self.wText
        }
        //self.drawArea.addSubview(yourLabel)
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
                self.lblDTMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDTMLFrameHeight.text = self.hText
                
                //self.lblDTMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDTMRFrameHeight.text = self.hText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.hText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblDTMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblDTMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblDTMRFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.hText
            
            self.lblDTMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDTMLFrameHeight.text = self.hText
            
            //self.lblDTMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDTMRFrameHeight.text = self.hText
        }
        //self.lblDTMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.lblDTMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        if isFirstTimeFrame{
            
            let point = CGSize(width: self.lblDTMLFrameHeight.frame.height , height: self.lblDTMLFrameHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblDTMLFrameHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblDTMRFrameHeight.frame.height , height: self.lblDTMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblDTMRFrameHeight)
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
        //self.drawArea.addSubview(labelBottom)
        
    }
}



// Bottom Mat *******************************

extension DoubleMatResultViewController{
    

    
    
    func drawShapeBottom() {
    
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 30
        layer.strokeColor = self.border.cgColor
        
        //        drawArea.addSubview(rectView)
        //drawArea2.layer.addSublayer(layer)\
        self.DBMFrameView.backgroundColor = self.border
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
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.wText
                
                self.lblDBMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDBMTFrameWidth.text = self.wText
                
                //self.lblDBMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDBMBFrameWidth.text = self.wText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = UIColor.white
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.wText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                 
                    self.lblDBMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblDBMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblDBMBFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.wText
            
            self.lblDBMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDBMTFrameWidth.text = self.wText
            
            //self.lblDBMBFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDBMBFrameWidth.text = self.wText
        }
        //self.drawArea2.addSubview(yourLabel)
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
                
                self.lblDBMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDBMLFrameHeight.text = self.hText
                
                //self.lblDBMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDBMRFrameHeight.text = self.hText
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = UIColor.white
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = self.hText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblDBMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblDBMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                //self.lblDBMRFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.hText
            
            self.lblDBMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDBMLFrameHeight.text = self.hText
            
            //self.lblDBMRFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDBMRFrameHeight.text = self.hText
        }
        //yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.lblDBMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea2.addSubview(yourLabel)
        if isFirstTimeFrame1{
            let point = CGSize(width: self.lblDBMLFrameHeight.frame.height , height: self.lblDBMLFrameHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblDBMLFrameHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblDBMRFrameHeight.frame.height , height: self.lblDBMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblDBMRFrameHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            isFirstTimeFrame1 = false
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
        //self.drawArea2.addSubview(labelBottom)
        
    }
}

class DoubleMatResultViewController: UITableViewController{
    
    // MARK: - Varibles
    
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBOutlet weak var unitSelector: UISwitch!
    
    @IBOutlet weak var scrollView: UIScrollView!
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
    
    @IBOutlet weak var lblDTMTFrameWidth: UILabel!
    @IBOutlet weak var lblDTMBFrameWidth: UILabel!
    @IBOutlet weak var lblDTMLFrameHeight: UILabel!
    @IBOutlet weak var lblDTMRFrameHeight: UILabel!
    @IBOutlet weak var lblDTMTImageWidth: UILabel!
    @IBOutlet weak var lblDTMBImageWidth: UILabel!
    @IBOutlet weak var lblDTMLImageHeight: UILabel!
    @IBOutlet weak var lblDTMRImageHeight: UILabel!
    @IBOutlet weak var lblDTMTOWidth: UILabel!
    @IBOutlet weak var lblDTMBOWidth: UILabel!
    @IBOutlet weak var lblDTMLOHeight: UILabel!
    @IBOutlet weak var lblDTMROHeight: UILabel!
    
    @IBOutlet weak var DTMFrameView: UIView!
    @IBOutlet weak var DTMImageView: UIView!
    @IBOutlet weak var DTMOverlapView: UIView!
    
    @IBOutlet weak var lblDBMTFrameWidth: UILabel!
    @IBOutlet weak var lblDBMBFrameWidth: UILabel!
    @IBOutlet weak var lblDBMLFrameHeight: UILabel!
    @IBOutlet weak var lblDBMRFrameHeight: UILabel!
    @IBOutlet weak var lblDBMTImageWidth: UILabel!
    @IBOutlet weak var lblDBMBImageWidth: UILabel!
    @IBOutlet weak var lblDBMLImageHeight: UILabel!
    @IBOutlet weak var lblDBMRImageHeight: UILabel!
    @IBOutlet weak var lblDBMTOWidth: UILabel!
    @IBOutlet weak var lblDBMBOWidth: UILabel!
    @IBOutlet weak var lblDBMLOHeight: UILabel!
    @IBOutlet weak var lblDBMROHeight: UILabel!
    
    @IBOutlet weak var DBMFrameView: UIView!
    @IBOutlet weak var DBMImageView: UIView!
    @IBOutlet weak var DBMOverlapView: UIView!
    
    var isFirstTimeImage = true
    var isFirstTimeOlapLeft = true
    var isFirstTimeOlapRight = true
    var isFirstTimeFrame = true
    
    var isFirstTimeImage1 = true
    var isFirstTimeOlapLeft1 = true
    var isFirstTimeOlapRight1 = true
    var isFirstTimeFrame1 = true
    
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

        
        
        // Bottom Mat
        
        
//        if self.drawArea2.layer.sublayers != nil{
//            for layer in self.drawArea2.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        setLabelsBottom()
        drawShapeBottom()
        drawImgShapeBottom()
        drawOverLapsBottom()
        
        drawArrow();
        //self.scrollView.delegate = self
        
       
    }
    
    func drawArrow(){
 
        let image = UIImage(named: "ic_down_arrow.png") as UIImage?
        button   = UIButton(type: UIButtonType.custom) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.center = CGPoint(x: frameRect.maxX - 10, y: self.view.bounds.height - 50)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.btnTouched(sender:)), for: .touchUpInside)
        //self.view.addSubview(button)
    }
    
    
    @objc func btnTouched(sender :UIButton){
        print("touched")
        let image = UIImage(named: "ic_down_arrow.png") as UIImage?
        if(button.currentImage == image){
        let bottomOffset = CGPoint(x: 0, y: (scrollView.contentSize.height - scrollView.bounds.size.height) - 30)
            scrollView.setContentOffset(bottomOffset, animated: true)
        }
        else {
            let bottomOffset = CGPoint(x: 0, y: 0)
            scrollView.setContentOffset(bottomOffset, animated: true)
        }
        
    }
    @IBAction func topArrowBtnPressed(_ sender: Any){
        self.tableView.scrollToRow(at: IndexPath.init(row: 2, section: 0), at: .bottom, animated: true)
    }
    @IBAction func bottomArrowBtnPressed(_ sender: Any){
        self.tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var scrollViewHeight = scrollView.frame.size.height;
        var scrollContentSizeHeight = scrollView.contentSize.height;
        var scrollOffset = scrollView.contentOffset.y;
        
        if (scrollOffset <= 100)
        {
            // then we are at the top
            print("top")
            let image = UIImage(named: "ic_down_arrow.png") as UIImage?
            button.setImage(image, for: .normal)
        }
        else if (scrollOffset + scrollViewHeight == scrollContentSizeHeight || scrollOffset + scrollViewHeight >= scrollContentSizeHeight - 299)
        {
            // then we are at the end
            print("bottom")
            let image = UIImage(named: "ic_up_arrow.png") as UIImage?
            button.setImage(image, for: .normal)
        }
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
        
        //Bottom MAt
//        if self.drawArea2.layer.sublayers != nil{
//            for layer in self.drawArea2.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        setLabelsBottom()
        drawShapeBottom()
        drawImgShapeBottom()
        drawOverLapsBottom()
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
        if let nextController = segue.destination as? CustomizationViewController{
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


extension DoubleMatResultViewController{
    
    func setLabels(){
        if ViewController.state.useInches{
//            let heightInInches = frameHeight/72
//            let widthInInches = frameWidth / 72
//            let imgHInInches = iHeight / 72
//            let imgWInInches = iWidth / 72
//            let newH = (h / 72)
//            let newW = (w / 72)
            
            let heightInInches = frameHeight/72
            let widthInInches = frameWidth / 72
            let imgHInInches = iHeight / 72 + (doubleBottom / 72)
            let imgWInInches = iWidth / 72 + (doubleBottom / 72)
            let newH = (h / 72) - (doubleBottom / 72)
            let newW = (w / 72) - (doubleBottom / 72)
            
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
                else if part1 == "0" {
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
                else if part1 == "0" {
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
        //self.drawArea.layer.addSublayer(layer)
        self.DTMImageView.backgroundColor = self.border
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
                
                self.lblDTMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDTMTImageWidth.text = imageWText
                
                //self.lblDTMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDTMBImageWidth.text = imageWText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageWText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblDTMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblDTMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                //self.lblDTMBImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageWText
            
            self.lblDTMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDTMTImageWidth.text = imageWText
            
            //self.lblDTMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDTMBImageWidth.text = imageWText
        }
        //self.drawArea.addSubview(yourLabel)
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
                
                self.lblDTMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDTMLImageHeight.text = imageHText
                
                //self.lblDTMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDTMRImageHeight.text = imageHText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageHText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblDTMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblDTMRImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageHText
            
            self.lblDTMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDTMLImageHeight.text = imageHText
            
            //self.lblDTMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDTMRImageHeight.text = imageHText
        }
        //lblDTMLImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblDTMRImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        if isFirstTimeImage{
            let point = CGSize(width: self.lblDTMLImageHeight.frame.height , height: self.lblDTMLImageHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblDTMLImageHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblDTMRImageHeight.frame.height , height: self.lblDTMRImageHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblDTMRImageHeight)
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
                
                self.lblDTMTOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblDTMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblDTMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblDTMTOWidth.text = topT
        }
        //self.drawArea.addSubview(yourLabel)
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
                
                self.lblDTMBOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblDTMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblDTMBOWidth.text = topT
        }
        //self.drawArea.addSubview(yourLabel)
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
                
                self.lblDTMLOHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblDTMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblDTMLOHeight.text = leftT
        }
        //lblDTMLOHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        if isFirstTimeOlapLeft{
            let point = CGSize(width: self.lblDTMLOHeight.frame.height , height: self.lblDTMLOHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblDTMLOHeight)
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
                self.lblDTMROHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMROHeight.attributedText = fractionMutableAttributedString(for: self.leftT, color: .red, size: 13)
                }
                else{
                    self.lblDTMROHeight.attributedText = fractionMutableAttributedString(for: self.leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblDTMROHeight.text = leftT
        }
        //lblDTMROHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        if isFirstTimeOlapRight{
            
            let point = CGSize(width: self.lblDTMROHeight.frame.height , height: self.lblDTMROHeight.frame.width)
                   let animatr = ChainableAnimator(view: self.lblDTMROHeight)
                   animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            isFirstTimeOlapRight = false
        }
       
        
    }
    
    
}

// Bottom Mat *************************************


extension DoubleMatResultViewController{
    
    func setLabelsBottom(){
        if ViewController.state.useInches{
            let heightInInches = frameHeight/72
            let widthInInches = frameWidth / 72
            let imgHInInches = iHeight / 72
            let imgWInInches = iWidth / 72
            let newH = (h / 72)
            let newW = (w / 72)
            
//            let heightInInches = frameHeight/72
//            let widthInInches = frameWidth / 72
//            let imgHInInches = iHeight / 72 - ((doubleBottom*2) / 72)
//            let imgWInInches = iWidth / 72 - ((doubleBottom*2) / 72)
//            let newH = (h / 72) + (doubleBottom / 72)
//            let newW = (w / 72) + (doubleBottom / 72)
            
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
    
    func drawImgShapeBottom() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.imageRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 25
        layer.strokeColor = self.border.cgColor
        //self.drawArea2.layer.addSublayer(layer)
        
        self.DBMImageView.backgroundColor = self.border
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
                
                self.lblDBMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDBMTImageWidth.text = imageWText
                
                //self.lblDBMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDBMBImageWidth.text = imageWText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageWText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDBMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    self.lblDBMTImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblDBMBImageWidth.attributedText = fractionMutableAttributedString(for: imageWText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageWText
            
            self.lblDBMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDBMTImageWidth.text = imageWText
            
            //self.lblDBMBImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDBMBImageWidth.text = imageWText
        }
        //self.drawArea2.addSubview(yourLabel)
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
                
                self.lblDBMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                self.lblDBMLImageHeight.text = imageHText
                
                //self.lblDBMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
                //self.lblDBMRImageHeight.text = imageHText
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                //yourLabel.text = imageHText
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblDBMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    
                    self.lblDBMLImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
                
                //self.lblDBMRImageHeight.attributedText = fractionMutableAttributedString(for: imageHText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = imageHText
            
            self.lblDBMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblDBMLImageHeight.text = imageHText
            
            //self.lblDBMRImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            //self.lblDBMRImageHeight.text = imageHText
        }
        //lblDBMLImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //lblDBMRImageHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea2.addSubview(yourLabel)
        if isFirstTimeImage1{
            let point = CGSize(width: self.lblDBMLImageHeight.frame.height , height: self.lblDBMLImageHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblDBMLImageHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            //let point1 = CGSize(width: self.lblDBMRImageHeight.frame.height , height: self.lblDBMRImageHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblDBMRImageHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            isFirstTimeImage1 = false
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
                
                self.lblDBMTOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    
                    self.lblDBMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    
                    self.lblDBMTOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblDBMTOWidth.text = topT
        }
        //self.drawArea2.addSubview(yourLabel)
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
                
                self.lblDBMBOWidth.text = topT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                //yourLabel.text = topT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDBMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 13)
                }
                else{
                    self.lblDBMBOWidth.attributedText = fractionMutableAttributedString(for: topT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = topT
            
            self.lblDBMBOWidth.text = topT
        }
        //self.drawArea2.addSubview(yourLabel)
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
                
                self.lblDBMLOHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
                yourLabel.textAlignment = NSTextAlignment.center
                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDBMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblDBMLOHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblDBMLOHeight.text = leftT
        }
        //lblDBMLOHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea2.addSubview(yourLabel)
        if isFirstTimeOlapLeft1{
            let point = CGSize(width: self.lblDBMLOHeight.frame.height , height: self.lblDBMLOHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblDBMLOHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            isFirstTimeOlapLeft1 = false
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
                
                self.lblDBMROHeight.text = leftT
            }
            else{
                //yourLabel.textColor = UIColor.red
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                //yourLabel.text = leftT
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDBMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 13)
                }
                else{
                    self.lblDBMROHeight.attributedText = fractionMutableAttributedString(for: leftT, color: .red, size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.red
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(13))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = leftT
            
            self.lblDBMROHeight.text = leftT
        }
        //lblDBMROHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea2.addSubview(yourLabel)
        if isFirstTimeOlapRight1{
            let point = CGSize(width: self.lblDBMROHeight.frame.height , height: self.lblDBMROHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblDBMROHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            isFirstTimeOlapRight1 = false
        }
        
        

    }
    
    
}

// Navigation Bar Buttons *************************************



extension DoubleMatResultViewController{
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
extension DoubleMatResultViewController{
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
            else if indexPath.row == 2{
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
            else if indexPath.row == 2{
                
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

