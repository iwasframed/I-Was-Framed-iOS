//
//  CustomizationSingleViewController.swift
//  Framed
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 ebmacs. All rights reserved.
//

import UIKit
import ChainableAnimations
class CustomizationSingleViewController: UIViewController {
    var colorPicker: ChromaColorPicker!
    @IBOutlet weak var colorDisplayView: UIView!
    
    
    @IBOutlet weak var singleMatView: UIView!
    @IBOutlet weak var colorSingleTop: UITextField!
    
    
    @IBOutlet weak var doubleMatView: UIView!
    @IBOutlet weak var colorDoubleTop: UITextField!
    
    @IBOutlet weak var colorDoubleBottom: UITextField!
    
    
    @IBOutlet weak var tripleMatView: UIView!
    
    @IBOutlet weak var colorTripleTop: UITextField!
    
    @IBOutlet weak var colorTripleMiddle: UITextField!
    
    @IBOutlet weak var colorTripleBottom: UITextField!
    
    @IBOutlet weak var drawArea: UIView!
    
    @IBOutlet weak var lblSMFrameWidth: UILabel!
    @IBOutlet weak var lblSMFrameHeight: UILabel!
    
    @IBOutlet weak var lblSMImageWidth: UILabel!
    @IBOutlet weak var lblSMImageHeight: UILabel!
    
    @IBOutlet weak var lblSMTWidth: UILabel!
    @IBOutlet weak var lblSMBWidth: UILabel!
    @IBOutlet weak var lblSMLHeight: UILabel!
    @IBOutlet weak var lblSMRHeight: UILabel!

    
    @IBOutlet weak var STMView: UIView!

    @IBOutlet weak var colorPickerView: NSLayoutConstraint!
    
    var colorVal: Int = 0
    
    var unitState : Bool = true
    var h : Double!
    var w : Double!
    var iWidth : Double!
    var iHeight : Double!
    var frameWidth: Double!
    var frameHeight: Double!
    var matState : Int!
    var border: UIColor!
    var frameRect : CGRect!
    var imageRect : CGRect!
    
    var actualImageHeight : Double!
    var actualImageWidth : Double!
    
    var oLap : Double!
    var doubleBottom: Double!
    var tripleMiddle: Double!
    var tripleBottom: Double!
    
    typealias Rational = (num : Int, den : Int)
    
    // MARK: - Functions
    

    
    func draw(){
//        if self.drawArea.layer.sublayers != nil{
//            for layer in self.drawArea.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        
        switch matState {
        case 0:
//            singleMatView.isHidden = false
//            doubleMatView.isHidden = true
//            tripleMatView.isHidden = true
            //self.drawBorder()
            self.singleMatCalculate()
            self.drawSingle()
            self.drawImage()
        case 1:
//            singleMatView.isHidden = true
//            doubleMatView.isHidden = false
//            tripleMatView.isHidden = true
            self.singleMatCalculate()
            //self.drawBorder2()
            self.drawSingle()
            self.doubleMatCalculate()
            self.drawDouble()
            self.drawImage()
            
            
        case 2:
//            singleMatView.isHidden = true
//            doubleMatView.isHidden = true
//            tripleMatView.isHidden = false
            self.singleMatCalculate()
            self.drawSingle()
            self.doubleMatCalculate()
            self.drawDouble()
            self.tripleMatCalculate()
            self.drawTriple()
            self.drawTriple2Image()
            self.drawTriple1Image()
            self.drawTripleImage()
        default: break
        }
        //self.labelToTop()
    }
    func labelToTop()
    {
//        for view in self.drawArea.subviews
//        {
//            if view.isKind(of: UILabel.self)
//            {
//                let label = view as! UILabel
//                label.superview?.bringSubview(toFront: self.view.superview!)
//            }
//            else
//            {
//                labelToTop()
//            }
//        }
    }
    func redraw(){
//        if self.drawArea.layer.sublayers != nil{
//            for layer in self.drawArea.layer.sublayers!{
//                layer.removeFromSuperlayer()
//            }
//        }
        
        switch matState {
        case 0:
//            singleMatView.isHidden = false
//            doubleMatView.isHidden = true
//            tripleMatView.isHidden = true
            //self.drawBorder()
            self.singleMatCalculate()
            self.redrawSingle()
            self.drawImage()
        case 1:
//            singleMatView.isHidden = true
//            doubleMatView.isHidden = false
//            tripleMatView.isHidden = true
            self.singleMatCalculate()
            self.drawBorder2()
            self.redrawSingle()
            self.doubleMatCalculate()
            self.drawDouble()
            self.drawImage()
        case 2:
//            singleMatView.isHidden = true
//            doubleMatView.isHidden = true
//            tripleMatView.isHidden = false
            self.singleMatCalculate()
            self.drawSingle()
            self.doubleMatCalculate()
            self.drawDouble()
            self.tripleMatCalculate()
            self.drawTriple()
            self.drawTriple2Image()
            self.drawTriple1Image()
            self.drawTripleImage()
        default: break
        }
        //self.labelToTop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.colorDisplayView.addSubview(colorPicker)
        //colorDisplayView.isHidden = true
        setNavigationItems()
        self.colorPickerView.constant = self.view.frame.height/5
        draw()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectSingleTopColor(_ sender: UIButton) {
        //colorVal = 1
        //colorDisplayView.isHidden = false
        sender.tag = 1
        makeColorSelector(sender)
        
    }
    
    @IBAction func middleDoubleColor(_ sender: UIButton) {
        colorVal = 2
        //colorDisplayView.isHidden = false
    }
    
    @IBAction func bottomDoubleColor(_ sender: UIButton) {
        colorVal = 3
        //colorDisplayView.isHidden = false
    }
    
    @IBAction func topTripleColor(_ sender: UIButton) {
        colorVal = 4
        //colorDisplayView.isHidden = false
    }
    
    @IBAction func middleTripleColor(_ sender: UIButton) {
        colorVal = 5
        //colorDisplayView.isHidden = false
    }
    
    @IBAction func bottomTripleColor(_ sender: UIButton) {
        colorVal = 6
        //colorDisplayView.isHidden = false
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Enter # before color code", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func showAlertHex(){
        let alert = UIAlertController(title: "Error", message: "Enter # before color code and correct hex code", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func singleTopColorValueChanged(_ sender: UITextField) {
        if var str = sender.text{
            if str.first != "#" {
                showAlert()
                sender.text = ""
                return
            }
            str = str.replacingOccurrences(of: "#", with: "")
            if str.count == 6 || str.count == 3{
                if let color: UIColor = UIColor(hexString: str) {
                    self.colorTop = color
                    print("Draw")
                    draw()
                    self.colorSingleTop.textColor = color
                    
                }
            }
        }
    }
    
    
    @IBAction func doubleTopColorValueChanged(_ sender: UITextField) {
        if var str = sender.text{
            if str.first != "#" {
                showAlert()
                sender.text = ""
                return
            }
            str = str.replacingOccurrences(of: "#", with: "")
            
            if str.count == 6 || str.count == 3{
                if let color: UIColor = UIColor(hexString: str) {
                    self.colorMid = color
                    print("Draw")
                    draw()
                    self.colorDoubleTop.textColor = color
                }
            }
        }
    }
    
    @IBAction func doubleBottomColorValueChanged(_ sender: UITextField) {
        if var str = sender.text{
            if str.first != "#" {
                showAlert()
                sender.text = ""
                return
            }
            str = str.replacingOccurrences(of: "#", with: "")
            
            if str.count == 6 || str.count == 3{
                if let color: UIColor = UIColor(hexString: str) {
                    self.colorBot = color
                    print("Draw")
                    draw()
                    self.colorDoubleBottom.textColor = color
                }
            }
        }
    }
    
    @IBAction func tripleTopColorValueChanged(_ sender: UITextField) {
        if var str = sender.text{
            if str.first != "#" {
                showAlert()
                sender.text = ""
                return
            }
            str = str.replacingOccurrences(of: "#", with: "")
            
            if str.count == 6 || str.count == 3{
                if let color: UIColor = UIColor(hexString: str) {
                    self.colorTop = color
                    print("Draw")
                    draw()
                    self.colorTripleTop.textColor = color
                }
            }
        }
        
    }
    
    @IBAction func tripleMidColorValueChanged(_ sender: UITextField) {
        if var str = sender.text{
            if str.first != "#" {
                showAlert()
                sender.text = ""
                return
            }
            str = str.replacingOccurrences(of: "#", with: "")
            
            if str.count == 6 || str.count == 3{
                if let color: UIColor = UIColor(hexString: str) {
                    self.tripleColor2 = color
                    print("Draw")
                    draw()
                    self.colorTripleMiddle.textColor = color
                }
            }
        }
    }
    
    @IBAction func tripleBottomColorValueChanged(_ sender: UITextField) {
        if var str = sender.text{
            if str.first != "#" {
                showAlert()
                sender.text = ""
                return
            }
            str = str.replacingOccurrences(of: "#", with: "")
            
            if str.count == 6 || str.count == 3{
                if let color: UIColor = UIColor(hexString: str) {
                    self.tripleColor1 = color
                    print("Draw")
                    draw()
                    self.colorTripleBottom.textColor = color
                }
            }
        }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //colorDisplayView.isHidden = true
        self.view.endEditing(true)
    }
    
    func makeColorSelector(_ sender: UIButton ){
        /* Calculate relative size and origin in bounds */
        //        let pickerSize = CGSize(width: colorDisplayView.bounds.width*0.8, height: colorDisplayView.bounds.width*0.8)
        //        let pickerOrigin = CGPoint(x: view.bounds.midX - pickerSize.width/2, y: (view.bounds.midY - pickerSize.height/2) + 40)
        let pickerSize = CGSize(width: self.view.bounds.width * 0.6, height: self.view.bounds.width * 0.6)
        let pickerOrigin = CGPoint(x: 0 , y: 0)
        
        /* Create Color Picker */
        colorPicker = ChromaColorPicker(frame: CGRect(origin: pickerOrigin, size: pickerSize))
        colorPicker.delegate = self
        colorPicker.tag = sender.tag
        /* Customize the view (optional) */
        //colorPicker.padding = 10
        colorPicker.padding = 5
        colorPicker.stroke = 3 //stroke of the rainbow circle
        colorPicker.layout()
        
        /* Customize for grayscale (optional) */
        colorPicker.supportsShadesOfGray = true // false by default
        //colorPicker.colorToggleButton.grayColorGradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.gray.cgColor] // You can also override gradient colors
        colorPicker.hexLabel.textColor = UIColor.white
        colorPicker.backgroundColor = .gray
        colorPicker.center = view.center

        
        self.view.addSubview(colorPicker)
    }
    

    @objc func touchScreen(){
        self.colorPicker.removeFromSuperview()
        
    }
    @objc func toUpload(){
        self.performSegue(withIdentifier: "toUpload", sender: nil)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "CUSTOMIZATION"
        self.navigationController?.setNavigationBarHidden(false, animated:
            false)
        
        
        //self.colorDisplayView.addSubview(colorPicker)
        //colorDisplayView.isHidden = true
        setNavigationItems()
        
        //draw()
    }
    
    @objc func goBackOnDone(){    self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    func takeSnapshotOfView(view:UIView) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: view.frame.size.width, height: view.frame.size.height))
        view.drawHierarchy(in: CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height), afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let nextController = segue.destination as? UploadSingleViewController{
//            nextController.viewsGroup = self.drawArea.subviews
//            nextController.layersGroup = self.drawArea.layer.sublayers
            nextController.unitState = self.unitState
            nextController.matState = self.matState
            nextController.border = border
            nextController.colorTop = self.colorTop
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
            
            nextController.SMH = SMH
            nextController.SMW = SMW
            nextController.DMW = DMW
            nextController.DMH = DMH
            nextController.TMW = TMW
            nextController.TMH = TMH
            nextController.firstShow = 0
            
        }
    }
    
    var singleMat:CGRect!
    var doubleMat:CGRect!
    var tripleMat:CGRect!
    
    var SMHeight = ""
    var SMWidth = ""
    var SMH = ""
    var SMW = ""
    var DMHeight = ""
    var DMWidth = ""
    var DMH = ""
    var DMW = ""
    var TMHeight = ""
    var TMWidth = ""
    var TMH = ""
    var TMW = ""
    
    var colorTop: UIColor = UIColor.black
    var colorMid: UIColor = UIColor.brown
    var colorBot: UIColor = UIColor.black
    
    var tripleColor1: UIColor = UIColor.black
    var tripleColor2: UIColor = UIColor(hexString: "#AF5C0C")
    var firstShow =  0
    
}

extension CustomizationSingleViewController: UITextFieldDelegate{

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if var str = textField.text {
                
                                if str.isEmpty {
                    textField.text = "#"
                    
                }
                else
                if str.first != "#" {
                    showAlert()
                    textField.text = "#"
                    
                    
                }
                else{
                    str = str.removeSpecialCharsFromString()
                    textField.text = str
                    str = str.replacingOccurrences(of: "#", with: "")
                    if str.count == 6 || str.count == 3{
                        if let color: UIColor = UIColor(hexString: str) {
                            self.colorTop = color
                            print("Draw")
                            //draw()
                            self.colorSingleTop.textColor = color
                            self.STMView.backgroundColor = color
                            self.lblSMTWidth.textColor = self.updateContrastColor(selectedColor: color)
                            self.lblSMBWidth.textColor = self.updateContrastColor(selectedColor: color)
                            self.lblSMLHeight.textColor = self.updateContrastColor(selectedColor: color)
                            self.lblSMRHeight.textColor = self.updateContrastColor(selectedColor: color)
                            
                        }
                    }
                }
                
            }
        }
    }


extension CustomizationSingleViewController: ChromaColorPickerDelegate{
    func colorPickerDidChooseColor(_ colorPicker: ChromaColorPicker, color: UIColor) {
        //Set color for the display view
        //        colorDisplayView.backgroundColor = color
        
        //Perform zesty anidmation
        UIView.animate(withDuration: 0.2,
                       animations: {
                        //self.colorDisplayView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: { (done) in
            UIView.animate(withDuration: 0.2, animations: {
                
                //self.colorDisplayView.transform = CGAffineTransform.identity
                //            self.colorFieldSingleTop.textColor = color
                //                self.colorFieldSingleTop.text = "#" + color.hexCode
                switch colorPicker.tag{
                case 0:
                    break
                case 1:
                    self.colorSingleTop.textColor = color
                    self.colorSingleTop.text = "#" + color.hexCode
                    self.colorTop = UIColor(hexString: color.hexCode)
                    self.STMView.backgroundColor = color
                    self.lblSMTWidth.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblSMBWidth.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblSMLHeight.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblSMRHeight.textColor = self.updateContrastColor(selectedColor: color)
                    
                    
                default:
                    break
                }
                self.colorPicker.removeFromSuperview()
                
                //self.colorDisplayView.isHidden = true
            })
        })
    }
}

extension CustomizationSingleViewController{
    
    func singleMatCalculate(){
        if ViewController.state.useInches{
            var height = (frameHeight - actualImageHeight )/2
            var width = (frameWidth - actualImageWidth )/2
            height /= 72
            width /= 72
            
            
            if !unitState{ //Fractions
                var n = floor(height)
                var whole = Int(n)
                var fract = rationalApproximationOf(x0: round((height-n) * 100)/100)
                
                if fract.num == 0 {
                    SMHeight = "\(whole) ″"
                }
                else if whole == 0{
                    SMHeight = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    SMHeight = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                n = floor(width)
                whole = Int(n)
                fract = rationalApproximationOf(x0: round((width-n) * 100)/100)
                
                if fract.num == 0 {
                    SMWidth = "\(whole) ″"
                }
                else if whole == 0{
                    SMWidth = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    SMWidth = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
            }
            else{
                SMWidth = "\(round(width * 100)/100)in"
                SMHeight = "\(round(height * 100)/100)in"
                let smwidthArr = SMWidth.split(separator: ".")
                if smwidthArr.count > 1{
                    if smwidthArr[1] == "0in"{
                        SMWidth = "\(smwidthArr[0])in"
                    }
                    
                }
                let smheightArr = SMHeight.split(separator: ".")
                if smheightArr.count > 1{
                    if smheightArr[1] == "0in"{
                        SMWidth = "\(smheightArr[0])in"
                    }
                    
                }
            }
        }
        else{
            var height = (frameHeight - actualImageHeight)/2
            var width = (frameWidth - actualImageWidth)/2
            height /= 28
            width /= 28
            
            if !unitState{//CentiMeters
                SMHeight = "\(round(height * 100)/100)cm"
                SMWidth = "\(round(width * 100)/100)cm"
            }
            else{
                height /= 100
                width /= 100
                SMHeight = "\(round(height * 100)/100)m"
                SMWidth = "\(round(width * 100)/100)m"
            }
        }
    }
    
    func doubleMatCalculate(){
        if ViewController.state.useInches{
            var height = frameHeight - actualImageHeight - (doubleBottom * 2)
            var width = frameWidth - actualImageWidth - (doubleBottom * 2)
            
            height /= 144
            width /= 144
            
            if unitState { //Fractions
                DMWidth = "\(round(width * 100)/100)\""
                DMHeight = "\(round(height * 100)/100)\""
                
            }
            else{
                var n = floor(height)
                var whole = Int(n)
                var fract = rationalApproximationOf(x0: round((height-n) * 100)/100)
                
                if fract.num == 0 {
                    DMHeight = "\(whole)\""
                }
                else{
                    DMHeight = "\(whole) \(fract.num)/\(fract.den)\""
                }
                
                n = floor(width)
                whole = Int(n)
                fract = rationalApproximationOf(x0: round((width-n) * 100)/100)
                
                if fract.num == 0 {
                    DMWidth = "\(whole)\""
                }
                else{
                    DMWidth = "\(whole) \(fract.num)/\(fract.den)\""
                }
                
            }
        }
        else{
            var height = frameHeight - actualImageHeight - (doubleBottom * 2)
            var width = frameWidth - actualImageWidth - (doubleBottom * 2)
            height /= 28
            width /= 28
            
            if !unitState{//CentiMeters
                DMHeight = "\(round(height * 100)/100)cm"
                DMWidth = "\(round(width * 100)/100)cm"
            }
            else{
                height /= 100
                width /= 100
                DMHeight = "\(round(height * 100)/100)m"
                DMWidth = "\(round(width * 100)/100)m"
            }
        }
    }
    
    func tripleMatCalculate(){
        if ViewController.state.useInches{
            var h = frameHeight - actualImageHeight;
            var mat = (tripleMiddle * 2) + (tripleBottom * 2)
            
            var height = h - mat
            
            var w = frameWidth - actualImageWidth
            var w_mat = (tripleBottom * 2) + (tripleMiddle * 2)
            var width =  w - w_mat
            height /= 144
            width /= 144
            
            if unitState{ //Fractions
                var n = floor(height)
                var whole = Int(n)
                var fract = rationalApproximationOf(x0: round((height-n) * 100)/100)
                
                if fract.num == 0 {
                    TMHeight = "\(whole)\""
                }
                else{
                    TMHeight = "\(whole) \(fract.num)/\(fract.den)\""
                }
                
                n = floor(width)
                whole = Int(n)
                fract = rationalApproximationOf(x0: round((width-n) * 100)/100)
                
                if fract.num == 0 {
                    TMWidth = "\(whole)\""
                }
                else{
                    TMWidth = "\(whole) \(fract.num)/\(fract.den)\""
                }
                
            }
            else{
                TMWidth = "\(round(width * 100)/100)\""
                TMHeight = "\(round(height * 100)/100)\""
            }
        }
        else{
            
            var h = frameHeight - actualImageHeight
            var h_mat = (doubleBottom * 2) - (tripleMiddle * 2)
            var height = h - h_mat
            
            var w = frameWidth - actualImageWidth
            var w_mat = (doubleBottom * 2) - (tripleMiddle * 2)
            var width = w - w_mat
            height /= 28
            width /= 28
            
            if !unitState{//CentiMeters
                TMHeight = "\(round(height * 100)/100)cm"
                TMWidth = "\(round(width * 100)/100)cm"
            }
            else{
                height /= 100
                width /= 100
                TMHeight = "\(round(height * 100)/100)m"
                TMWidth = "\(round(width * 100)/100)m"
            }
        }
    }
}


extension CustomizationSingleViewController{
    private func setNavigationItems(){
        self.navigationItem.backBarButtonItem?.title = " "
        
        self.navigationItem.title = "CUSTOMIZATION"
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
        //
        //        self.navigationItem.leftBarButtonItem = leftbtn
        
    }
    
    private func setRightBarButton(){
        
        let rightbtn = UIButton(type: .roundedRect)
        rightbtn.setImage(#imageLiteral(resourceName: "Next-btn").withRenderingMode(.alwaysOriginal), for: .normal)
        
        rightbtn.addTarget(self, action: #selector(toUpload), for: .touchUpInside)
        
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let width = rightbtn.widthAnchor.constraint(equalToConstant: 100)
            width.isActive = true
            let height = rightbtn.heightAnchor.constraint(equalToConstant: 50)
            height.isActive = true
        }
        else{
            let width = rightbtn.widthAnchor.constraint(equalToConstant: 50)
            width.isActive = true
            let height = rightbtn.heightAnchor.constraint(equalToConstant: 25)
            height.isActive = true
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbtn)
        
        //        self.navigationItem.leftBarButtonItem = leftbtn
    }
    
}

//let singleLayer = CAShapeLayer()
//let doubleLayer = CAShapeLayer()

extension CustomizationSingleViewController{
    func drawSingle(){
        
        
//        if frameRect.height > self.drawArea.frame.height
//        {
//            frameRect.size.height = self.drawArea.frame.height - 50
//        }
//        
//        
//        if frameRect.width > drawArea.frame.width
//        {
//            frameRect.size.width = drawArea.frame.width - 50
//        }
//        
//        if firstShow < 2 {
//            frameRect.origin = CGPoint(x: self.view.bounds.midX - (frameRect.width / 2) - 10, y:  self.drawArea.bounds.midY - (frameRect.height / 2) + 35)
//            firstShow += 1
//        }
//        else{
//            frameRect.origin = CGPoint(x: self.view.bounds.midX - (frameRect.width / 2) - 10, y:  self.drawArea.bounds.midY - (frameRect.height / 2))
//        }
//        
//        
//        //        self.frameRect = rect
//        
//        if imageRect.height > frameRect.height
//        {
//            imageRect.size.height = frameRect.height - 20
//            if imageRect.height < 0{
//                imageRect.size.height = 0
//            }
//        }
//        
//        
//        if imageRect.width > frameRect.width
//        {
//            imageRect.size.width = frameRect.width - 20
//            if imageRect.width < 0{
//                imageRect.size.width = 0
//            }
//        }
//        //        if !ViewController.state.useInches {
//        //            imageRect.size.width = imageRect.size.width + 50
//        //        }
//        
//        imageRect.origin = CGPoint(x: frameRect.midX - (imageRect.width / 2), y:  frameRect.midY - (imageRect.height / 2))
//        
//        
//        
//        singleLayer.path = UIBezierPath.init(rect: frameRect).cgPath
//        singleLayer.fillColor = self.colorBot.cgColor
        
        
        //drawArea.layer.addSublayer(singleLayer)
        self.STMView.backgroundColor = self.colorTop
        let orig = frameRect.origin
        var orig1 = frameRect.origin
        
        var yourLabel: UILabel!
        
        if(self.matState == 1){
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 45, width: self.view.frame.width/2, height: 30))
            
        }
        else if(self.matState == 0){
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 35, width: self.view.frame.width/2, height: 30))
            
        }
        else {
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4 , y: orig1.y - 50, width: self.view.frame.width/2, height: 30))
        }
        yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = UIColor.black
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.SMW
                
                self.lblSMFrameWidth.text = self.SMW
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                //yourLabel.text = self.SMW
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                }
                else{
                    self.lblSMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 30)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.black
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.SMW
            
            self.lblSMFrameWidth.text = self.SMW
        }
        //self.drawArea.addSubview(yourLabel)
        
        
        if(self.matState == 1){
            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 30, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
        }
        else if(self.matState == 0){
            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 22, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
            
        }
        else {
            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 38, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
        }
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textColor = UIColor.black
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = self.SMH
                
                self.lblSMFrameHeight.text = self.SMH
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = UIColor.black
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                //yourLabel.text = self.SMH
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                }
                else{
                    self.lblSMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 30)
                }
                
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = UIColor.black
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.SMH
            
            self.lblSMFrameHeight.text = self.SMH
        }
        //lblSMFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        let point = CGSize(width: self.lblSMFrameHeight.frame.height , height: self.lblSMFrameHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblSMFrameHeight)
        animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
        
        
        //        orig1 = imageRect.origin
        //        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig1.y + 20, width: self.view.frame.width/2, height: 30))
        //        yourLabel.backgroundColor = UIColor.clear
        //        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        //        yourLabel.textColor = UIColor.white
        //        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.DMW
        //        self.drawArea.addSubview(yourLabel)
        
        
        //        yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 + 25, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
        //        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        //        yourLabel.textColor = UIColor.white
        //        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.DMH
        //        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //        self.drawArea.addSubview(yourLabel)
        
        
        //Top
        if (self.matState == 0) {
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4 , y: orig.y + 10 , width: self.view.frame.width/2, height: 30))
            yourLabel.backgroundColor = UIColor.clear
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.text = SMHeight
                    
                    self.lblSMTWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMTWidth.text = SMHeight
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMHeight
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMHeight
                
                self.lblSMTWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMTWidth.text = SMHeight
            }
            //self.drawArea.addSubview(yourLabel)
            
            
            
            //Bottom
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 40 + frameRect.height, width: self.view.frame.width/2, height: 30))
            yourLabel.backgroundColor = UIColor.clear
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.text = SMHeight
                    
                    self.lblSMBWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMBWidth.text = SMHeight
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMHeight
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMHeight
                
                self.lblSMBWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMBWidth.text = SMHeight
            }
            //self.drawArea.addSubview(yourLabel)
            
            //Left
            yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 25, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
            yourLabel.backgroundColor = UIColor.clear
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.text = SMWidth
                    
                    self.lblSMLHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMLHeight.text = SMWidth
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMWidth
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMWidth
                
                self.lblSMLHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMLHeight.text = SMWidth
            }
            //lblSMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            //self.drawArea.addSubview(yourLabel)
            
            let point = CGSize(width: self.lblSMLHeight.frame.height , height: self.lblSMLHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            

            
            //Right
            yourLabel = UILabel(frame: CGRect(x: frameRect.maxX - self.view.frame.width/4 - 25, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
            yourLabel.backgroundColor = UIColor.clear
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.text = SMWidth
                    
                    self.lblSMRHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMRHeight.text = SMWidth
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMWidth
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMWidth
                
                self.lblSMRHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMRHeight.text = SMWidth
            }
            //lblSMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            //self.drawArea.addSubview(yourLabel)
            
            let point1 = CGSize(width: self.lblSMRHeight.frame.height , height: self.lblSMRHeight.frame.width)
            let animatr1 = ChainableAnimator(view: self.lblSMRHeight)
            animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
        }
        
    }
    func redrawSingle(){
        
        
//        singleLayer.path = UIBezierPath.init(rect: frameRect).cgPath
//        singleLayer.fillColor = colorBot.cgColor
//
//        drawArea.layer.addSublayer(singleLayer)
//
//        let orig = frameRect.origin
//        var orig1 = frameRect.origin
//
//        var yourLabel: UILabel!
//
//        if(self.matState == 1){
//            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 40, width: self.view.frame.width/2, height: 30))
//
//        }
//        else if(self.matState == 0){
//            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 35, width: self.view.frame.width/2, height: 30))
//
//        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 28, width: self.view.frame.width/2, height: 30))
//        }
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//        yourLabel.textColor = UIColor.black
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = self.SMW
//
//        self.drawArea.addSubview(yourLabel)
//
//
//        if(self.matState == 1){
//            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 27, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        }
//        else if(self.matState == 0){
//            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 17, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//
//        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        }
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(16))
//        yourLabel.textColor = UIColor.black
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = self.SMH
//        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
//
//        //        orig1 = imageRect.origin
//        //        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig1.y + 20, width: self.view.frame.width/2, height: 30))
//        //        yourLabel.backgroundColor = UIColor.clear
//        //        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
//        //        yourLabel.textColor = UIColor.white
//        //        yourLabel.textAlignment = NSTextAlignment.center
//        //        yourLabel.text = self.DMW
//        //        self.drawArea.addSubview(yourLabel)
//
//
//        //        yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 + 25, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        //        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
//        //        yourLabel.textColor = UIColor.white
//        //        yourLabel.textAlignment = NSTextAlignment.center
//        //        yourLabel.text = self.DMH
//        //        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        //        self.drawArea.addSubview(yourLabel)
//
//
//        //Top
//        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4 - 15, y: orig.y , width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMHeight
//        yourLabel.superview?.bringSubview(toFront: self.drawArea)
//        self.drawArea.addSubview(yourLabel)
//
//
//        //Bottom
//        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 25 + frameRect.height, width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMHeight
//        self.drawArea.addSubview(yourLabel)
//
//        //Left
//        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMWidth
//        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
//
//        //Right
//        yourLabel = UILabel(frame: CGRect(x: frameRect.maxX - self.view.frame.width/4 - 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMWidth
//        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
    }
    
    
    func drawBorder(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width + 20, height: self.frameRect.height + 20)))
        
        k.backgroundColor = UIColor(hexString: "#81460d")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
    }
    
    func drawBorder2(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width + 40, height: self.frameRect.height + 30)))
        
        k.backgroundColor = UIColor(hexString: "#81460d")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
    }
    
    func drawImage(){
        
        var k: Draw!
        if ViewController.state.useInches {
            k = Draw(frame: CGRect(
                origin: CGPoint(x: 0, y: 0),
                size: CGSize(width: self.frameRect.width - 100, height: self.frameRect.height - 100)))
        }
        else {
            k = Draw(frame: CGRect(
                origin: CGPoint(x: 0, y: 0),
                size: CGSize(width: self.frameRect.width - 100, height: self.frameRect.height - 100)))
        }
        k.backgroundColor = UIColor(hexString: "#EBE2C6")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
        
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState //fractions
            {
//                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
//                labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//                labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                
                
                self.lblSMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
            }
            else
            {
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72)) \""
                //labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //labeTop.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                
//                self.lblSMImageWidth.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblSMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                self.lblSMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
            }
            else{
                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                self.lblSMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
            }
//            labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        self.lblSMImageWidth.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        
        labeTop.frame.origin = k.bounds.origin;
        labeTop.center = CGPoint(x: k.bounds.midX, y: 10);
        //k.addSubview(labeTop)
        
        
        
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState {
                labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
                labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                
                self.lblSMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
                
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
                //labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                labelLeft.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblSMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
                self.lblSMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
                self.lblSMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
            }
            //labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
            //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        
        self.lblSMImageHeight.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        labelLeft.frame.origin = k.bounds.origin;
        //labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        //k.addSubview(labelLeft)
        
        let point = CGSize(width: self.lblSMImageHeight.frame.height , height: self.lblSMImageHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblSMImageHeight)
        animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
        

        
        
    }
    
    
    func drawTripleImage(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 150, height: self.frameRect.height - 150)))
        
        k.backgroundColor = UIColor(hexString: "#EBE2C6")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        self.drawArea.addSubview(k)
        
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        if ViewController.state.useInches {
            labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))\""
        }
        else {
            labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
        }
        
        labeTop.textColor = UIColor.black
        labeTop.frame.origin = k.bounds.origin;
        labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        labeTop.center = CGPoint(x: k.bounds.midX, y: 10);
        k.addSubview(labeTop)
        
        
        
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        if ViewController.state.useInches {
            labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
        }
        else {
            labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
        }
        labelLeft.textColor = UIColor.black
        labelLeft.frame.origin = k.bounds.origin;
        labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        k.addSubview(labelLeft)
        
    }
    
    
    
    func drawTriple1Image(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 130, height: self.frameRect.height - 130)))
        
        k.backgroundColor = tripleColor1
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        self.drawArea.addSubview(k)
        
        
        //TOP
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        var rational = rationalApproximationOf(x0: tripleBottom/72)
        
        if ViewController.state.useInches {
            
            if(rational.den == 1){
                labeTop.text = String("\(rational.num)\"")
            }
                
            else {
                labeTop.text = String("\(rational.num)/\(rational.den)\"")
            }
            
        } else {
            let cmText = tripleBottom / 72
            labeTop.text = String(format: "%.02f", cmText) + "cm"
        }
        //        labeTop.text = String(format: "%.0f", actualImageWidth / 72)
        labeTop.textColor = UIColor(hexString: "#cccccc")
        labeTop.frame.origin = k.bounds.origin;
        labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labeTop.center = CGPoint(x: k.bounds.midX+15, y: 4);
        k.addSubview(labeTop)
        
        
        
        //Bottom
        
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.center = k.center
        labelBottom.textAlignment = .center
        
        
        if ViewController.state.useInches {
            
            if(rational.den == 1){
                labelBottom.text = String("\(rational.num)")
            }
                
            else {
                labelBottom.text = String("\(rational.num)/\(rational.den)\"")
            }
        }
        else {
            let cmText = tripleBottom / 72
            labelBottom.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelBottom.textColor = UIColor(hexString: "#cccccc")
        labelBottom.frame.origin = k.bounds.origin;
        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelBottom.center = CGPoint(x: k.bounds.midX+15, y: k.bounds.maxY - 4);
        k.addSubview(labelBottom)
        
        
        
        //LEFT
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        var rational1 = rationalApproximationOf(x0: tripleBottom/72)
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelLeft.text = String("\(rational1.num)\"")
            }
                
            else {
                labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
            }
        }
        else {
            let cmText = tripleBottom / 72
            labelLeft.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelLeft.textColor = UIColor(hexString: "#cccccc")
        labelLeft.frame.origin = k.bounds.origin;
        labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 4, y: k.bounds.midY+15);
        k.addSubview(labelLeft)
        
        
        //Right
        
        let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelRight.textAlignment = .center
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelRight.text = String("\(rational1.num)\"")
            }
                
            else {
                labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
            }
            
        }
        else {
            let cmText = tripleBottom / 72
            labelRight.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelRight.textColor = UIColor(hexString: "#cccccc")
        labelRight.frame.origin = k.bounds.origin;
        labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelRight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelRight.center = CGPoint(x: k.bounds.maxX-4, y: k.bounds.midY+15);
        k.addSubview(labelRight)
        
        
    }
    
    func drawTriple2Image(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 110, height: self.frameRect.height - 110)))
        
        k.backgroundColor = tripleColor2
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        self.drawArea.addSubview(k)
        
        
        //Top
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        var rational = rationalApproximationOf(x0: tripleMiddle/72)
        if ViewController.state.useInches {
            
            if(rational.den == 1){
                labeTop.text = String("\(rational.num)\"")
            }
                
            else {
                labeTop.text = String("\(rational.num)/\(rational.den)\"")
            }
        }
        else {
            let cmText = tripleMiddle / 72
            labeTop.text = String(format: "%.02f", cmText) + "cm"
        }
        
        
        labeTop.textColor = UIColor(hexString: "#cccccc")
        labeTop.frame.origin = k.bounds.origin;
        labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labeTop.center = CGPoint(x: k.bounds.midX, y: 4);
        k.addSubview(labeTop)
        
        
        //Bottom
        
        
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.center = k.center
        labelBottom.textAlignment = .center
        
        if ViewController.state.useInches {
            if(rational.den == 1){
                labelBottom.text = String("\(rational.num)\"")
            }
                
            else {
                labelBottom.text = String("\(rational.num)/\(rational.den)\"")
            }
        }
        else {
            let cmText = tripleMiddle / 72
            labelBottom.text = String(format: "%.02f", cmText) + "cm"
        }
        
        
        labelBottom.textColor = UIColor(hexString: "#cccccc")
        labelBottom.frame.origin = k.bounds.origin;
        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelBottom.center = CGPoint(x: k.bounds.midX, y: k.bounds.maxY - 4);
        k.addSubview(labelBottom)
        
        //LEFT
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        var rational1 = rationalApproximationOf(x0: tripleMiddle/72)
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelLeft.text = String("\(rational1.num)\"")
            }
                
            else {
                labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
            }
            
        }
        else {
            let cmText = tripleMiddle / 72
            labelLeft.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelLeft.textColor = UIColor(hexString: "#cccccc")
        labelLeft.frame.origin = k.bounds.origin;
        labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 4, y: k.bounds.midY);
        k.addSubview(labelLeft)
        
        
        //RIGHT
        
        
        let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelRight.textAlignment = .center
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelRight.text = String("\(rational1.num)\"")
            }
                
            else {
                labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
            }
            
        }
        else {
            let cmText = tripleMiddle / 72
            labelRight.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelRight.textColor = UIColor(hexString: "#cccccc")
        labelRight.frame.origin = k.bounds.origin;
        labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelRight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelRight.center = CGPoint(x: k.bounds.maxX-4, y: k.bounds.midY);
        k.addSubview(labelRight)
        
        
    }
    
    
    func drawDouble(){
        if imageRect.height > frameRect.height
        {
            imageRect.size.height = frameRect.height - 20
            if imageRect.height < 0{
                imageRect.size.height = 0
            }
        }
        
        
        if imageRect.width > frameRect.width
        {
            imageRect.size.width = frameRect.width - 20
            if imageRect.width < 0{
                imageRect.size.width = 0
            }
        }
        
        imageRect.origin = CGPoint(x: frameRect.midX - (imageRect.width / 2), y:  frameRect.midY - (imageRect.height / 2))
        
        //        self.frameRect = rect
        
        
        doubleLayer.path = UIBezierPath.init(rect: self.imageRect).cgPath
        doubleLayer.fillColor = UIColor.clear.cgColor
        doubleLayer.lineWidth = 30
        doubleLayer.strokeColor = colorMid.cgColor
        
        drawArea.layer.addSublayer(doubleLayer)
        
        
        //TOP
        
        let orig = frameRect.origin
        var yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 20 , width: self.view.frame.width/2, height: 30))
        
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMW)\""
        }
        self.drawArea.addSubview(yourLabel)
        
        
        
        // LEft
        //yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 - 10, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMH)\""
        }
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        
        
        //Right
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 - 10, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMH)\""
        }
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        
        
        //Bottom
        
        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 20 , width: self.view.frame.width/2, height: 30))
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMH)\""
        }
        self.drawArea.addSubview(yourLabel)
        
        
        
        //Top
        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y - 5 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMHeight
        self.drawArea.addSubview(yourLabel)
        
        //Bottom
        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y - 5 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMHeight
        self.drawArea.addSubview(yourLabel)
        
        //Left
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMWidth
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        //Right
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMWidth
        
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
    }
    
    
    
    func drawTriple(){
        var rect :CGRect! = imageRect
        rect?.size.width -= 20
        rect?.size.height -= 20
        
        
        if (rect?.height)! < CGFloat(0.0){
            rect?.size.height = 0
        }
        if (rect?.width)! < CGFloat(0.0){
            rect?.size.width = 0
        }
        
        
        rect.origin = CGPoint(x: frameRect.midX - (rect.width / 2), y:  frameRect.midY - (rect.height / 2))
        
        //        self.frameRect = rect
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: rect).cgPath
        layer.fillColor = colorTop.cgColor
        layer.lineWidth = 30
        layer.strokeColor = colorTop.cgColor
        
        drawArea.layer.addSublayer(layer)
        let orig = rect?.origin
        var yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! + 20, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.TMW
        self.drawArea.addSubview(yourLabel)
        
        
        yourLabel = UILabel(frame: CGRect(x: (orig?.x)! - self.view.frame.width/4 + 25, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.TMH
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        //Top
        yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! - 5 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr = TMHeight.components(separatedBy: ".")
            
            var firstNum: String = numArr[0]
            var secondNum: String = numArr[1]
            
            if(secondNum == "0\""){
                yourLabel.text = "\(firstNum)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMHeight
        }
        self.drawArea.addSubview(yourLabel)
        
        //Bottom
        yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! - 15 + rect.height, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr1 = TMHeight.components(separatedBy: ".")
            
            var firstNum1: String = numArr1[0]
            var secondNum1: String = numArr1[1]
            
            if(secondNum1 == "0\""){
                yourLabel.text = "\(firstNum1)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum1.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum1) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMHeight
        }
        
        self.drawArea.addSubview(yourLabel)
        
        //Left
        yourLabel = UILabel(frame: CGRect(x: (orig?.x)! - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr2 = TMWidth.components(separatedBy: ".")
            
            var firstNum2: String = numArr2[0]
            var secondNum2: String = numArr2[1]
            
            if(secondNum2 == "0\""){
                yourLabel.text = "\(firstNum2)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum2.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum2) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMWidth
        }
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        //Right
        yourLabel = UILabel(frame: CGRect(x: rect.maxX - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr3 = TMWidth.components(separatedBy: ".")
            
            var firstNum3: String = numArr3[0]
            var secondNum3: String = numArr3[1]
            
            if(secondNum3 == "0\""){
                yourLabel.text = "\(firstNum3)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum3.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum3) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMWidth
        }
        
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
    }
    
    
    func drawShape() {
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 30
        layer.strokeColor = self.border.cgColor
        
        //        drawArea.addSubview(rectView)
        //drawArea.layer.addSublayer(layer)
        self.addLabels(frameRect)
        self.addLabels2(frameRect)
    }
    
    func addLabels(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.wText
       // self.drawArea.addSubview(yourLabel)
    }
    
    func addLabels2(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        
        //        yourLabel.text = self.hText
        
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
    }
    
}



