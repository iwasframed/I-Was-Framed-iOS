//
//  CustomizationViewController.swift
//  Framed
//
//  Created by Dr. Atta on 02/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import ChameleonFramework
import ChainableAnimations
class CustomizationViewController: UIViewController {
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
    var defaultFrameReact : CGRect!
    var defaultImageReact : CGRect!
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
            self.drawBorder()
			self.singleMatCalculate()
            if ViewController.state.useInches{
                self.drawSingle()
            }
            else{
                self.drawSingle()
            }
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
            //self.drawShape()
			self.singleMatCalculate()
                self.drawSingle()

			//self.drawBorder()
			self.doubleMatCalculate()
			//self.drawDouble()
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
            self.drawBorder()
            self.singleMatCalculate()
            if ViewController.state.useInches{
                self.drawSingle()
            }
            else{
                self.drawSingle()
            }
            self.drawImage()
        case 1:
//            singleMatView.isHidden = true
//            doubleMatView.isHidden = false
//            tripleMatView.isHidden = true
            self.singleMatCalculate()
            self.drawBorder2()
            if ViewController.state.useInches{
                self.drawSingle()
            }
            else{
                self.drawSingle()
            }
            self.doubleMatCalculate()
            self.drawDouble()
            self.drawImage()
        case 2:
//            singleMatView.isHidden = true
//            doubleMatView.isHidden = true
//            tripleMatView.isHidden = false
            //self.drawShape()
            self.singleMatCalculate()
            if ViewController.state.useInches{
                self.drawSingle()
            }
            else{
                self.drawSingle()
            }
            self.drawBorder()
            self.doubleMatCalculate()
            //self.drawDouble()
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
        self.colorTop = self.border
		
		//self.colorDisplayView.addSubview(colorPicker)
		//colorDisplayView.isHidden = true
		setNavigationItems()
		self.defaultFrameReact = self.frameRect
        self.defaultImageReact = self.imageRect
        
        self.colorPickerView.constant = self.view.frame.height/5
		draw()
        
		// Do any additional setup after loading the view.
    }
	
	@IBAction func selectColor(_ sender: UIButton) {
		colorVal = 1
		//colorDisplayView.isHidden = false
	}
	
	@IBAction func selectDoubleTopColor(_ sender: UIButton) {
        sender.tag = 1
        makeColorSelector(sender)
	}
	
	@IBAction func selectDoubleBottomColor(_ sender: UIButton) {
		sender.tag = 2
        makeColorSelector(sender)
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
					self.colorBot = color
					print("Draw")
					singleLayer.fillColor = self.colorBot.cgColor
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
	
	@objc func toUpload(){
		self.performSegue(withIdentifier: "toUpload", sender: nil)
        
	}

	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        
		self.navigationItem.title = "CUSTOMIZATION"
		self.navigationController?.setNavigationBarHidden(false, animated:
			false)
        //draw()
		
		//self.colorDisplayView.addSubview(colorPicker)
		//colorDisplayView.isHidden = true
		setNavigationItems()
		
        
	}
	
	@objc func goBackOnDone(){	self.navigationController?.popToRootViewController(animated: true)
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
		if let nextController = segue.destination as? UploadViewController{
//            nextController.layersGroup = self.drawArea.layer.sublayers

            nextController.unitState = self.unitState
            nextController.matState = self.matState
            nextController.border = border
            nextController.colorTop = self.colorTop
            nextController.colorMid = self.colorMid
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
    
    
    @IBOutlet weak var lblDMFrameWidth: UILabel!
    @IBOutlet weak var lblDMFrameHeight: UILabel!
    
    @IBOutlet weak var lblDMImageWidth: UILabel!
    @IBOutlet weak var lblDMImageHeight: UILabel!
    
    @IBOutlet weak var lblDTMTWidth: UILabel!
    @IBOutlet weak var lblDTMBWidth: UILabel!
    @IBOutlet weak var lblDTMLHeight: UILabel!
    @IBOutlet weak var lblDTMRHeight: UILabel!
    
    @IBOutlet weak var lblDBMTWidth: UILabel!
    @IBOutlet weak var lblDBMBWidth: UILabel!
    @IBOutlet weak var lblDBMLHeight: UILabel!
    @IBOutlet weak var lblDBMRHeight: UILabel!
    
    
    @IBOutlet weak var DTMView: UIView!
    @IBOutlet weak var DBMView: UIView!
    
     @IBOutlet weak var colorPickerView: NSLayoutConstraint!

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
	var colorBot: UIColor = UIColor.white
    
    var tripleColor1: UIColor = UIColor.black
    var tripleColor2: UIColor = UIColor(hexString: "#AF5C0C")
    var firstShow =  0
	
}
extension CustomizationViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == self.colorDoubleTop{
                if var str = textField.text{
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
                                self.colorDoubleTop.textColor = color
                                self.DTMView.backgroundColor = color
                                self.lblDTMTWidth.textColor = self.updateContrastColor(selectedColor: color)
                                self.lblDTMBWidth.textColor = self.updateContrastColor(selectedColor: color)
                                self.lblDTMLHeight.textColor = self.updateContrastColor(selectedColor: color)
                                self.lblDTMRHeight.textColor = self.updateContrastColor(selectedColor: color)
                                
                            }
                        }
                    }
                    
                }
                
            }
            else if textField == self.colorDoubleBottom{
                if var str = textField.text{
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
                                self.colorMid = color
                                print("Draw")
                                //draw()
                                self.colorDoubleBottom.textColor = color
                                self.DBMView.backgroundColor = color
                                self.lblDBMTWidth.textColor = self.updateContrastColor(selectedColor: color)
                                self.lblDBMBWidth.textColor = self.updateContrastColor(selectedColor: color)
                                self.lblDBMLHeight.textColor = self.updateContrastColor(selectedColor: color)
                                self.lblDBMRHeight.textColor = self.updateContrastColor(selectedColor: color)
                                
                            }
                        }
                    }
                    
                }
                
            }
            else{
                
            }
            
        }
        
    }


extension CustomizationViewController: ChromaColorPickerDelegate{
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
                    self.colorDoubleTop.textColor = color
                    self.colorDoubleTop.text = "#" + color.hexCode
                    self.colorTop = UIColor(hexString: color.hexCode)
                    self.DTMView.backgroundColor = color
                    self.lblDTMTWidth.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblDTMBWidth.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblDTMLHeight.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblDTMRHeight.textColor = self.updateContrastColor(selectedColor: color)
                case 2:
                    self.colorDoubleBottom.textColor = color
                    self.colorDoubleBottom.text = "#" + color.hexCode
                    self.colorMid = UIColor(hexString: color.hexCode)
                    self.DBMView.backgroundColor = color
                    self.lblDBMTWidth.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblDBMBWidth.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblDBMLHeight.textColor = self.updateContrastColor(selectedColor: color)
                    self.lblDBMRHeight.textColor = self.updateContrastColor(selectedColor: color)
                    
                default:
                    break
                }
                self.colorPicker.removeFromSuperview()
                //self.draw()
                //self.colorDisplayView.isHidden = true
            })
        })
    }
}


extension CustomizationViewController{
	
	func singleMatCalculate(){
		if ViewController.state.useInches{
			var height = (frameHeight - actualImageHeight )/2
			var width = (frameWidth - actualImageWidth )/2
			height /= 72
			width /= 72
			
			
			if !unitState{ //Fractions
				var n = floor(height)
				var whole = Int(n)
                let remaind = height - n
				var fract = rationalApproximationOf(x0: remaind)
				
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
                
                let remaind2 = width - n
				fract = rationalApproximationOf(x0: remaind2)
				
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
			var height = (frameHeight - actualImageHeight) - (doubleBottom*2 )
			var width = (frameWidth - actualImageWidth) - (doubleBottom*2 )
            
			
			
			if unitState { //Fractions
                height /= 144
                width /= 144
                DMWidth = "\(round(width * 100)/100)in"
                DMHeight = "\(round(height * 100)/100)in"
				
			}
			else{
                height /= 144
                width /= 144
                var n = floor(height)
                var whole = Int(n)
                
                let remaind = height - n
                var fract = rationalApproximationOf(x0: remaind)
                
                if fract.num == 0 {
                    DMHeight = "\(whole) ″"
                }
                else if whole == 0{
                    DMHeight = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    DMHeight = "\(whole) \(fract.num)/\(fract.den) ″"
                }
                
                n = floor(width)
                whole = Int(n)
                
                let remaind2 = width - n
                fract = rationalApproximationOf(x0: remaind2)
                
                if fract.num == 0 {
                    DMWidth = "\(whole) ″"
                }
                else if whole == 0{
                    DMWidth = "\(fract.num)/\(fract.den) ″"
                }
                else{
                    DMWidth = "\(whole) \(fract.num)/\(fract.den) ″"
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
			
			if !unitState{ //Fractions
				var n = floor(height)
				var whole = Int(n)
                
                let remaind = height - n
				var fract = rationalApproximationOf(x0: remaind)
				
				if fract.num == 0 {
					TMHeight = "\(whole) ″"
				}
				else if whole == 0{
					TMHeight = "\(fract.num)/\(fract.den) ″"
				}
                else{
                    TMHeight = "\(whole) \(fract.num)/\(fract.den) ″"
                }
				
				n = floor(width)
				whole = Int(n)
                
                let remaind2 = width - n
				fract = rationalApproximationOf(x0: remaind2)
				
				if fract.num == 0 {
					TMWidth = "\(whole) ″"
				}
				else if whole == 0{
					TMWidth = "\(fract.num)/\(fract.den) ″"
				}
                else{
                    TMWidth = "\(whole) \(fract.num)/\(fract.den) ″"
                }
				
			}
			else{
				TMWidth = "\(round(width * 100)/100)in"
				TMHeight = "\(round(height * 100)/100)in"
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


extension CustomizationViewController{
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

let singleLayer = CAShapeLayer()
let doubleLayer = CAShapeLayer()

extension CustomizationViewController{
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
////        self.frameRect = rect
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
////        if !ViewController.state.useInches {
////            imageRect.size.width = imageRect.size.width + 50
////        }
//
//        imageRect.origin = CGPoint(x: frameRect.midX - (imageRect.width / 2), y:  frameRect.midY - (imageRect.height / 2))
//
//
//
//        singleLayer.path = UIBezierPath.init(rect: frameRect).cgPath
//        singleLayer.fillColor = self.colorBot.cgColor
        
    
		//drawArea.layer.addSublayer(singleLayer)
		self.DBMView.backgroundColor = self.colorMid
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
                
                self.lblDMFrameWidth.text = self.SMW
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                //yourLabel.text = self.SMW
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                }
                else{
                    self.lblDMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 30)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.black
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.SMW
            
            self.lblDMFrameWidth.text = self.SMW
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
                
                self.lblDMFrameHeight.text = self.SMH
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = UIColor.black
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                //yourLabel.text = self.SMH
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                }
                else{
                    self.lblDMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 30)
                }
                
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = UIColor.black
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.SMH
            
            self.lblDMFrameHeight.text = self.SMH
        }
		//lblDMFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
        
        let point = CGSize(width: self.lblDMFrameHeight.frame.height , height: self.lblDMFrameHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblDMFrameHeight)
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
                    
                    self.lblDTMTWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
                    self.lblDTMTWidth.text = SMHeight
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMHeight
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblDTMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                    }
                    else{
                        self.lblDTMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMHeight
                
                self.lblDTMTWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDTMTWidth.text = SMHeight
            }
            //self.drawArea.addSubview(yourLabel)
        

		
		//Bottom
		yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 40 + frameRect.height, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMHeight
                
                self.lblDTMBWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDTMBWidth.text = SMHeight
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                //yourLabel.text = SMHeight
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                }
                else{
                    self.lblDTMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = SMHeight
            
            self.lblDTMBWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
            self.lblDTMBWidth.text = SMHeight
        }
		//self.drawArea.addSubview(yourLabel)
		
		//Left
		yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 25, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMWidth
                
                self.lblDTMLHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDTMLHeight.text = SMWidth
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                //yourLabel.text = SMWidth
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                }
                else{
                    self.lblDTMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = SMWidth
            
            self.lblDTMLHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
            self.lblDTMLHeight.text = SMWidth
        }
		lblDTMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
		
		//Right
		yourLabel = UILabel(frame: CGRect(x: frameRect.maxX - self.view.frame.width/4 - 25, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMWidth
                
                self.lblDTMRHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDTMRHeight.text = SMWidth
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                //yourLabel.text = SMWidth
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                }
                else{
                    self.lblDTMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//            yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = SMWidth
            
            self.lblDTMRHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
            self.lblDTMRHeight.text = SMWidth
        }
		lblDTMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
        }
		
	}
    
    func redrawSingle(){
        
    
        singleLayer.path = UIBezierPath.init(rect: frameRect).cgPath
        singleLayer.fillColor = self.colorBot.cgColor
        
        //drawArea.layer.addSublayer(singleLayer)
        
        let orig = frameRect.origin
        var orig1 = frameRect.origin
        
        var yourLabel: UILabel!
        
        if(self.matState == 1){
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 40, width: self.view.frame.width/2, height: 30))
            
        }
        else if(self.matState == 0){
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 35, width: self.view.frame.width/2, height: 30))
            
        }
        else {
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 28, width: self.view.frame.width/2, height: 30))
        }
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        yourLabel.textColor = UIColor.black
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = self.SMW
        
        //self.drawArea.addSubview(yourLabel)
        
        
        if(self.matState == 1){
            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 27, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
        }
        else if(self.matState == 0){
            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 17, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
            
        }
        else {
            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
        }
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(16))
        yourLabel.textColor = UIColor.black
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = self.SMH
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
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
        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4 - 15, y: orig.y , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = SMHeight
        yourLabel.superview?.bringSubview(toFront: self.drawArea)
        //self.drawArea.addSubview(yourLabel)
        
        
        //Bottom
        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 25 + frameRect.height, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = SMHeight
        //self.drawArea.addSubview(yourLabel)
        
        //Left
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = SMWidth
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        //Right
        yourLabel = UILabel(frame: CGRect(x: frameRect.maxX - self.view.frame.width/4 - 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = SMWidth
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
    }
    
    
    func drawBorder(){
        var size: CGSize!
        if (self.matState == 0){
            size = CGSize(width: self.frameRect.width + 20, height: self.frameRect.height + 20)
        }
        else if(self.matState == 1){
            size = CGSize(width: self.frameRect.width + 5 , height: self.frameRect.height )
        }
        else{
            size = CGSize(width: self.frameRect.width + 55 , height: self.frameRect.height  + 50)
        }
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: size))
        
        k.backgroundColor = UIColor(hexString: "#81460d")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
    }
    
    func drawBorder2(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width + 45 , height: self.frameRect.height + 40 )))
        
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
                
                self.lblDMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
                
            }
            else
            {
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72)) \""
                //labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                labeTop.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblDMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
                self.lblDMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
            }
            else{
               // labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
                self.lblDMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
            }
//            labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        self.lblDMImageWidth.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))

        labeTop.frame.origin = k.bounds.origin;
        labeTop.center = CGPoint(x: k.bounds.midX, y: 10);
        //k.addSubview(labeTop)
        
    
        
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState {
//                labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
//                labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                
                self.lblDMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
                //labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                labelLeft.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblDMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
                self.lblDMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
                self.lblDMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
            }
//            labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        
        self.lblDMImageHeight.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        labelLeft.frame.origin = k.bounds.origin;
        //labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        //k.addSubview(labelLeft)
        let point = CGSize(width: self.lblDMImageHeight.frame.height , height: self.lblDMImageHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblDMImageHeight)
        animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
        

        
        
    }
    
    
    func drawTripleImage(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 120, height: self.frameRect.height - 120)))
        
        k.backgroundColor = UIColor(hexString: "#EBE2C6")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
        
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState{
                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
                labeTop.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            }
            else{
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))\""
                //labeTop.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                labeTop.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
            }
            
        }
        else {
            if unitState{
                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
            }
            else{
                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
            }
            labeTop.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
            
        
        labeTop.frame.origin = k.bounds.origin;
        
        labeTop.center = CGPoint(x: k.bounds.midX, y: 10);
        k.addSubview(labeTop)
        
        
        
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        if ViewController.state.useInches {
            if unitState{
                labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
                labelLeft.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
                //labelLeft.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                labelLeft.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
            }
            
        }
        else {
            if unitState{
                labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
            }
            else{
                labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
            }
            labelLeft.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        
        labelLeft.frame.origin = k.bounds.origin;
        
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        k.addSubview(labelLeft)
        
    }
    
    
    
    func drawTriple1Image(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 90, height: self.frameRect.height - 90)))
        
        k.backgroundColor = tripleColor1
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
        
        
        //TOP
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
    
        var rational = rationalApproximationOf(x0: tripleBottom/72)

        if ViewController.state.useInches {
            if unitState{
                labeTop.text = "\(tripleBottom/72)in"
                labeTop.textColor = updateContrastColor(selectedColor: tripleColor1)
                labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            else{
                if(rational.den == 1){
                    labeTop.text = String("\(rational.num) ″")
                    labeTop.textColor = updateContrastColor(selectedColor: tripleColor1)
                    labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                }
                    
                else {
                    //labeTop.text = String("\(rational.num)/\(rational.den) \"")
                    labeTop.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                }
                
                
            }
            
            
        } else {
            if unitState{
                let cmText = tripleBottom / 72
                labeTop.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleBottom / 72
                labeTop.text = String(format: "%.02f", cmText) + "cm"
            }
            labeTop.textColor = updateContrastColor(selectedColor: tripleColor1)
            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
//        labeTop.text = String(format: "%.0f", actualImageWidth / 72)
        
        labeTop.frame.origin = k.bounds.origin;
        
        labeTop.center = CGPoint(x: k.bounds.midX, y: 8);
        k.addSubview(labeTop)
        
        
        
        //Bottom
        
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.center = k.center
        labelBottom.textAlignment = .center
        
        
        if ViewController.state.useInches {
            if unitState{
                labelBottom.text = "\(tripleBottom/72)in"
                labelBottom.textColor = updateContrastColor(selectedColor: tripleColor1)
                labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            else{
                if(rational.den == 1){
                    labelBottom.text = String("\(rational.num) ″")
                    labelBottom.textColor = updateContrastColor(selectedColor: tripleColor1)
                    labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                }
                    
                else {
                    //labelBottom.text = String("\(rational.num)/\(rational.den) \"")
                    labelBottom.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                }
                
                
            }
            
        }
        else {
            if unitState{
                let cmText = tripleBottom / 72
                labelBottom.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleBottom / 72
                labelBottom.text = String(format: "%.02f", cmText) + "cm"
            }
            labelBottom.textColor = updateContrastColor(selectedColor: tripleColor1)
            labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
        
        
        labelBottom.frame.origin = k.bounds.origin;
        
        labelBottom.center = CGPoint(x: k.bounds.midX, y: k.bounds.maxY - 8);
        k.addSubview(labelBottom)
        
        
        
        //LEFT
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        var rational1 = rationalApproximationOf(x0: tripleBottom/72)

        if ViewController.state.useInches {
            if unitState{
                labelLeft.text = "\(tripleBottom/72)in"
                labelLeft.textColor = updateContrastColor(selectedColor: tripleColor1)
                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            else{
                if(rational1.den == 1){
                    labelLeft.text = String("\(rational1.num) ″")
                    labelLeft.textColor = updateContrastColor(selectedColor: tripleColor1)
                    labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                }
                    
                else {
                    //labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
                    labelLeft.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                }
                
            }
            
        }
        else {
            if unitState{
                let cmText = tripleBottom / 72
                labelLeft.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleBottom / 72
                labelLeft.text = String(format: "%.02f", cmText) + "cm"
            }
            labelLeft.textColor = updateContrastColor(selectedColor: tripleColor1)
            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
        
        
        labelLeft.frame.origin = k.bounds.origin;
        
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 8, y: k.bounds.midY);
        k.addSubview(labelLeft)
        
        
        //Right
        
        let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelRight.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState{
                labelRight.text = "\(tripleBottom/72)in"
                labelRight.textColor = updateContrastColor(selectedColor: tripleColor1)
                labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                
            }
            else{
                if(rational1.den == 1){
                    labelRight.text = String("\(rational1.num) ″")
                    labelRight.textColor = updateContrastColor(selectedColor: tripleColor1)
                    labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                }
                    
                else {
                    //labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
                    labelRight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                }
            }
            
        
        }
        else {
            if unitState{
                let cmText = tripleBottom / 72
                labelRight.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleBottom / 72
                labelRight.text = String(format: "%.02f", cmText) + "cm"
            }
            labelRight.textColor = updateContrastColor(selectedColor: tripleColor1)
            labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
        
        
        labelRight.frame.origin = k.bounds.origin;
        
        labelRight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelRight.center = CGPoint(x: k.bounds.maxX-8, y: k.bounds.midY);
        k.addSubview(labelRight)
        
        
    }
    
    func drawTriple2Image(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 60, height: self.frameRect.height - 60)))
        
        k.backgroundColor = tripleColor2
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
        
        
        //Top
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        var rational = rationalApproximationOf(x0: tripleMiddle/72)
        if ViewController.state.useInches {
            if unitState{
                labeTop.text = "\(tripleMiddle/72)in"
                labeTop.textColor = updateContrastColor(selectedColor: tripleColor2)
                labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                
            }
            else{
                if(rational.den == 1){
                    labeTop.text = String("\(rational.num) ″")
                    labeTop.textColor = updateContrastColor(selectedColor: tripleColor2)
                    labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                }
                    
                else {
                    //labeTop.text = String("\(rational.num)/\(rational.den)\"")
                    labeTop.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                }
            }
            
        }
        else {
            if unitState{
                let cmText = tripleMiddle / 72
                labeTop.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleMiddle / 72
                labeTop.text = String(format: "%.02f", cmText) + "cm"
            }
            labeTop.textColor = updateContrastColor(selectedColor: tripleColor2)
            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
        
        
        
        labeTop.frame.origin = k.bounds.origin;
        
        labeTop.center = CGPoint(x: k.bounds.midX, y: 8);
        k.addSubview(labeTop)
        
        
        //Bottom
        
        
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.center = k.center
        labelBottom.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState{
                labelBottom.text = "\(tripleMiddle/72)in"
                labelBottom.textColor = updateContrastColor(selectedColor: tripleColor2)
                labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                
            }
            else{
                if(rational.den == 1){
                    labelBottom.text = String("\(rational.num) ″")
                    labelBottom.textColor = updateContrastColor(selectedColor: tripleColor2)
                    labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                }
                    
                else {
                    //labelBottom.text = String("\(rational.num)/\(rational.den)\"")
                    labelBottom.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                }
            }
            
        }
        else {
            if unitState{
                let cmText = tripleMiddle / 72
                labelBottom.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleMiddle / 72
                labelBottom.text = String(format: "%.02f", cmText) + "cm"
            }
            labelBottom.textColor = updateContrastColor(selectedColor: tripleColor2)
            labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
        
        
        
        labelBottom.frame.origin = k.bounds.origin;
        
          labelBottom.center = CGPoint(x: k.bounds.midX, y: k.bounds.maxY - 6);
        k.addSubview(labelBottom)
        
        //LEFT
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        var rational1 = rationalApproximationOf(x0: tripleMiddle/72)
        
        if ViewController.state.useInches {
            if unitState{
                labelLeft.text = "\(tripleMiddle/72)in"
                labelLeft.textColor = updateContrastColor(selectedColor: tripleColor2)
                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                
            }
            else{
                if(rational1.den == 1){
                    labelLeft.text = String("\(rational1.num) ″")
                    labelLeft.textColor = updateContrastColor(selectedColor: tripleColor2)
                    labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                }
                    
                else {
                    //labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
                    labelLeft.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                }
            }
        
            
        }
        else {
            if unitState{
                let cmText = tripleMiddle / 72
                labelLeft.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleMiddle / 72
                labelLeft.text = String(format: "%.02f", cmText) + "cm"
            }
            labelLeft.textColor = updateContrastColor(selectedColor: tripleColor2)
            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
            
        
        labelLeft.frame.origin = k.bounds.origin;
        
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 8, y: k.bounds.midY);
        k.addSubview(labelLeft)
        
        
        //RIGHT
        
        
        let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelRight.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState{
                labelRight.text = "\(tripleMiddle/72)in"
                labelRight.textColor = updateContrastColor(selectedColor: tripleColor2)
                labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            else{
                if(rational1.den == 1){
                    labelRight.text = String("\(rational1.num) ″")
                    labelRight.textColor = updateContrastColor(selectedColor: tripleColor2)
                    labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                }
                    
                else {
                    //labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
                    labelRight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                }
            }
        
            
        }
        else {
            if unitState{
                let cmText = tripleMiddle / 72
                labelRight.text = String(format: "%.02f", cmText) + "m"
            }
            else{
                let cmText = tripleMiddle / 72
                labelRight.text = String(format: "%.02f", cmText) + "cm"
            }
            labelRight.textColor = updateContrastColor(selectedColor: tripleColor2)
            labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
        }
            
        
        labelRight.frame.origin = k.bounds.origin;
        
        labelRight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelRight.center = CGPoint(x: k.bounds.maxX-6, y: k.bounds.midY);
        k.addSubview(labelRight)
        
        
    }
    
    
	func drawDouble(){
//        if imageRect.height > frameRect.height
//        {
//            imageRect.size.height = frameRect.height - 40
//            if imageRect.height < 0{
//                imageRect.size.height = 0
//            }
//        }
////        else{
////            imageRect.size.height = frameRect.height - 80
////        }
//
//
//        if imageRect.width > frameRect.width
//        {
//            imageRect.size.width = frameRect.width - 40
//            if imageRect.width < 0{
//                imageRect.size.width = 0
//            }
//        }
////        else
////        {
////            imageRect.size.width = frameRect.width - 80
////        }
//
//        imageRect.origin = CGPoint(x: frameRect.midX - (imageRect.width / 2), y:  frameRect.midY - (imageRect.height / 2))
//
//        //        self.frameRect = rect
//
//
//        doubleLayer.path = UIBezierPath.init(rect: self.imageRect).cgPath
//        doubleLayer.fillColor = UIColor.clear.cgColor
//        doubleLayer.lineWidth = 40
//        doubleLayer.strokeColor = colorMid.cgColor
        
        //drawArea.layer.addSublayer(doubleLayer)
        
        
        //TOP
        self.DTMView.backgroundColor = self.colorTop
        let orig = frameRect.origin
        var yourLabel : UILabel!


        if(matState == 1){
            
            yourLabel = UILabel(frame: CGRect(x: frameRect.minX + 25 , y: orig.y + 25 , width: self.view.frame.width/2, height: 30))
            if ViewController.state.useInches{
                
                if unitState{
//                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.text = "\(self.DMW)"
                    
                    self.lblDBMTWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
                    self.lblDBMTWidth.text = "\(self.DMW)"
                }
                else{
                    let rational = rationalApproximationOf(x0: doubleBottom/72)
                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
//                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblDBMTWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                    }
                    else{
                        self.lblDBMTWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                    }
                    
                }
            }
            else{
                
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                //yourLabel.text = "\(self.DMW)"
//                yourLabel.text = "\(self.DMW)"
                
                self.lblDBMTWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDBMTWidth.text = "\(self.DMW)"
            }
        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y + 17, width: self.view.frame.width/2, height: 30))
//            yourLabel.text = "\(self.DMW)\""
//        }
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textAlignment = NSTextAlignment.center
        //self.drawArea.addSubview(yourLabel)


        //Bottom


        if(matState == 1){
            yourLabel = UILabel(frame: CGRect(x: frameRect.minX + 25 , y: frameRect.maxY - 55 , width: self.view.frame.width/2, height: 30))

            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.text = "\(self.DMW)"
                    
                    self.lblDBMBWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
                    self.lblDBMBWidth.text = "\(self.DMW)"
                }
                else{
                    let rational = rationalApproximationOf(x0: doubleBottom/72)
                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblDBMBWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                    }
                    else{
                        self.lblDBMBWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.text = "\(self.DMW)"
                
                self.lblDBMBWidth.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDBMBWidth.text = "\(self.DMW)"
            }
        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: imageRect.height - 10, width: self.view.frame.width/2, height: 30))
//            yourLabel.text = "\(self.DMH)\""
//        }


        //yourLabel.textAlignment = NSTextAlignment.center
        //self.drawArea.addSubview(yourLabel)

        // LEft

        if(matState == 1){
            yourLabel = UILabel(frame: CGRect(x: frameRect.minX - 55, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))

            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.text = "\(self.DMH)"
                    
                    self.lblDBMLHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
                    self.lblDBMLHeight.text = "\(self.DMH)"
                }
                else{
                    let rational = rationalApproximationOf(x0: doubleBottom/72)
                    
                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblDBMLHeight.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                    }
                    else{
                        self.lblDBMLHeight.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.text = "\(self.DMH)"
                
                self.lblDBMLHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDBMLHeight.text = "\(self.DMH)"
            }
        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 28, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
//            yourLabel.text = "\(self.DMH)\""
//        }
        //yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
//
//        yourLabel.backgroundColor = UIColor.clear
//
//        yourLabel.textAlignment = NSTextAlignment.center
        //lblDBMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        let point = CGSize(width: self.lblDBMLHeight.frame.height , height: self.lblDBMLHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblDBMLHeight)
        animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
        





        //Right

        if(matState == 1){
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - 10 , y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
            
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.text = "\(self.DMH)"
                    
                    self.lblDBMRHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
                    self.lblDBMRHeight.text = "\(self.DMH)"
                }
                else{
                    let rational = rationalApproximationOf(x0: doubleBottom/72)
                    
                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblDBMRHeight.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 13)
                    }
                    else{
                        self.lblDBMRHeight.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorMid), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.text = "\(self.DMH)"
                
                self.lblDBMRHeight.textColor = updateContrastColor(selectedColor: self.colorMid)
                self.lblDBMRHeight.text = "\(self.DMH)"
            }
        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: imageRect.maxX - self.view.frame.width/4 - 30, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
//            yourLabel.text = "\(self.DMH)\""
//        }


//        yourLabel.textAlignment = NSTextAlignment.center
        //lblDBMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        
        let point1 = CGSize(width: self.lblDBMRHeight.frame.height , height: self.lblDBMRHeight.frame.width)
        let animatr1 = ChainableAnimator(view: self.lblDBMRHeight)
        animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)

      
        

        
        
		
		//Top
//        if(matState == 1){
            //yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/6, y: orig.y - 5 , width: self.view.frame.width/2, height: 30))
            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: imageRect.origin.y - 5, width: self.view.frame.width/2, height: 12))
//        }
//        else{
//            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y , width: self.view.frame.width/2, height: 12))
//        }
		
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = DMHeight
                
                self.lblDTMTWidth.textColor = updateContrastColor(selectedColor: colorTop)
                self.lblDTMTWidth.text = DMHeight
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorMid), size: 11)
                //yourLabel.text = DMHeight
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMTWidth.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorTop), size: 13)
                }
                else{
                    self.lblDTMTWidth.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorTop), size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = DMHeight
            
            self.lblDTMTWidth.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblDTMTWidth.text = DMHeight
        }
		//self.drawArea.addSubview(yourLabel)
		
		//Bottom
//        if(matState == 1){
            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: imageRect.maxY - 5 , width: self.view.frame.width/2, height: 12))
//        }
//        else{
//            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y  , width: self.view.frame.width/2, height: 12))
//        }
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = DMHeight
                
                self.lblDTMBWidth.textColor = updateContrastColor(selectedColor: colorTop)
                self.lblDTMBWidth.text = DMHeight
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorMid), size: 11)
                //yourLabel.text = DMHeight
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMBWidth.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorTop), size: 13)
                }
                else{
                    self.lblDTMBWidth.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorTop), size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = DMHeight
            
            self.lblDTMBWidth.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblDTMBWidth.text = DMHeight
        }
		//self.drawArea.addSubview(yourLabel)
		
		//Left
 //       if(matState == 1){
            yourLabel = UILabel(frame: CGRect(x: (imageRect.origin.x - self.view.frame.width/4), y: imageRect.midY, width: self.view.frame.width/2, height: 12))
//        }
//        else{
//            yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 12))
//        }
		
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = DMWidth
                
                self.lblDTMLHeight.textColor = updateContrastColor(selectedColor: colorTop)
                self.lblDTMLHeight.text = DMWidth
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorMid), size: 11)
                //yourLabel.text = DMWidth
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMLHeight.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorTop), size: 13)
                }
                else{
                    self.lblDTMLHeight.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorTop), size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = DMWidth
            
            self.lblDTMLHeight.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblDTMLHeight.text = DMWidth
        }
		//lblDTMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
        
        let point2 = CGSize(width: self.lblDTMLHeight.frame.height , height: self.lblDTMLHeight.frame.width)
        let animatr2 = ChainableAnimator(view: self.lblDTMLHeight)
        animatr2.make(backgroundColor: .clear).make(width: Float(point2.width)).make(height: Float(point2.height)).rotate(angle: -90).animate(t: 0.11)
        
		
		//Right
        if(matState == 1){
            //yourLabel = UILabel(frame: CGRect(x: imageRect.midX - 15, y: imageRect.midY, width: self.view.frame.width/2, height: 12))
            yourLabel = UILabel(frame: CGRect(x: imageRect.maxX - self.view.frame.width/4, y: imageRect.midY, width: self.view.frame.width/2, height: 12))
        }
        else{
            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - 15, y: imageRect.midY, width: self.view.frame.width/2, height: 12))
        }
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            if unitState{
//                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = DMWidth
                
                self.lblDTMRHeight.textColor = updateContrastColor(selectedColor: colorTop)
                self.lblDTMRHeight.text = DMWidth
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorMid), size: 11)
                //yourLabel.text = DMWidth
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblDTMRHeight.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorTop), size: 13)
                }
                else{
                    self.lblDTMRHeight.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorTop), size: 26)
                }
                
            }
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = DMWidth
            
            self.lblDTMRHeight.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblDTMRHeight.text = DMWidth
        }
        
		//lblDTMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
        
        let point3 = CGSize(width: self.lblDTMRHeight.frame.height , height: self.lblDTMRHeight.frame.width)
        let animatr3 = ChainableAnimator(view: self.lblDTMRHeight)
        animatr3.make(backgroundColor: .clear).make(width: Float(point3.width)).make(height: Float(point3.height)).rotate(angle: -90).animate(t: 0.11)
        

	}
    
    
	
	func  drawTriple(){
		var rect :CGRect! = imageRect
		rect?.size.width += 30
		rect?.size.height += 30
		
		
		if (rect?.height)! < CGFloat(0.0){
			rect?.size.height = 0
		}
		if (rect?.width)! < CGFloat(0.0){
			rect?.size.width = 0
		}
		
		
		rect.origin = CGPoint(x: frameRect.midX - (rect.width / 2), y:  frameRect.midY - (rect.height / 2))
		
		//		self.frameRect = rect
		
		let layer = CAShapeLayer()
		layer.path = UIBezierPath.init(rect: rect).cgPath
		layer.fillColor = colorTop.cgColor
		layer.lineWidth = 20
		layer.strokeColor = colorTop.cgColor
		
		//drawArea.layer.addSublayer(layer)
		let orig = rect?.origin
		var yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! + 10, width: self.view.frame.width/2, height: 12))
		yourLabel.backgroundColor = UIColor.clear
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
		yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
		yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = self.TMW
		//self.drawArea.addSubview(yourLabel)
		
		
		yourLabel = UILabel(frame: CGRect(x: (orig?.x)! - self.view.frame.width/4 + 15, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 12))
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
		yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
		yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = self.TMH
		yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
		
		//Top
		yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! + 10 , width: self.view.frame.width/2, height: 12))
		yourLabel.backgroundColor = UIColor.clear
		yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
		yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
        
            if unitState{
                let numArr = TMHeight.components(separatedBy: ".")
                
                var firstNum: String = numArr[0]
                var secondNum: String = numArr[1]
                
                if(secondNum == "0in"){
                    yourLabel.text = "\(firstNum)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum) \(String("\(rational.num)/\(rational.den)") )\""
                    yourLabel.text = TMHeight
                }
            }
            else{
                
                
                let numArr = TMHeight.components(separatedBy: " ")
                
                var firstNum: String!
                var secondNum: String!
                
                if numArr.count > 1 {
                    firstNum = numArr[0]
                    secondNum = numArr[1]
                    if(secondNum == "0"){
                        yourLabel.text = "\(firstNum) ″"
                    }
                    else {
                        yourLabel.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 11)
                    }
                }
                else{
                    //firstNum = numArr[0]
                    //yourLabel.text = "\(firstNum)\""
                    yourLabel.text = TMHeight
                }
                
            }
            
        }
        else {
             yourLabel.text = TMHeight
        }
		//self.drawArea.addSubview(yourLabel)
		
		//Bottom
		yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)!  + rect.height - 20, width: self.view.frame.width/2, height: 12))
		yourLabel.backgroundColor = UIColor.clear
		yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
		yourLabel.textAlignment = NSTextAlignment.center
        
          if ViewController.state.useInches {
            if unitState{
                let numArr1 = TMHeight.components(separatedBy: ".")
                
                var firstNum1: String = numArr1[0]
                var secondNum1: String = numArr1[1]
                
                if(secondNum1 == "0in"){
                    yourLabel.text = "\(firstNum1)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum1.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum1) \(String("\(rational.num)/\(rational.den)") )in"
                    yourLabel.text = TMHeight
                }
            }
            else{
                let numArr1 = TMHeight.components(separatedBy: " ")
                var firstNum1: String!
                var secondNum1: String!
                
                if numArr1.count > 1 {
                    firstNum1 = numArr1[0]
                    secondNum1 = numArr1[1]
                    
                    if(secondNum1 == "0"){
                        yourLabel.text = "\(firstNum1) ″"
                    }
                    else{
                         yourLabel.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 11)
                    }
                }
                else{
                    //firstNum1 = numArr1[0]
                    //yourLabel.text = "\(firstNum1)\""
                    yourLabel.text = TMHeight
                }
                
            }
		
        
        }
          else {
            yourLabel.text = TMHeight
        }
        
		//self.drawArea.addSubview(yourLabel)
		
		//Left
		yourLabel = UILabel(frame: CGRect(x: ((orig?.x)! - self.view.frame.width/4) + 15, y: rect.midY , width: self.view.frame.width/2, height: 12))
		yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
		yourLabel.textAlignment = NSTextAlignment.center
		
          if ViewController.state.useInches {
            if unitState{
                let numArr2 = TMWidth.components(separatedBy: ".")
                
                var firstNum2: String = numArr2[0]
                var secondNum2: String = numArr2[1]
                
                if(secondNum2 == "0in"){
                    yourLabel.text = "\(firstNum2)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum2.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum2) \(String("\(rational.num)/\(rational.den)") )in"
                    yourLabel.text = TMWidth
                }
            }
            else{
                let numArr2 = TMWidth.components(separatedBy: " ")
                
                var firstNum2: String!
                var secondNum2: String!
               
                if numArr2.count > 1 {
                    firstNum2 = numArr2[0]
                    secondNum2 = numArr2[1]
                    
                    if(secondNum2 == "0"){
                        yourLabel.text = "\(firstNum2) ″"
                    }

                    else{
                        yourLabel.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 11)
                    }
                }
                else{
                    //firstNum2 = numArr2[0]
                    //yourLabel.text = "\(firstNum2)\""
                    yourLabel.text = TMWidth
                }
                
            }
        
        
        }
          else {
            yourLabel.text = TMWidth
        }
		yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
		
		//Right
		yourLabel = UILabel(frame: CGRect(x: (rect.maxX - self.view.frame.width/4) - 15, y: rect.midY , width: self.view.frame.width/2, height: 12))
		yourLabel.backgroundColor = UIColor.clear
		yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
		yourLabel.textAlignment = NSTextAlignment.center
	
          if ViewController.state.useInches {
            if unitState{
                let numArr3 = TMWidth.components(separatedBy: ".")
                
                var firstNum3: String = numArr3[0]
                var secondNum3: String = numArr3[1]
                
                if(secondNum3 == "0in"){
                    yourLabel.text = "\(firstNum3)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum3.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum3) \(String("\(rational.num)/\(rational.den)") )in"
                    yourLabel.text = TMWidth
                }
            }
            else{
                let numArr3 = TMWidth.components(separatedBy: " ")
                
                var firstNum3: String!
                var secondNum3: String!
                
                if numArr3.count > 1 {
                    firstNum3 = numArr3[0]
                    secondNum3 = numArr3[1]
                    
                    if(secondNum3 == "0"){
                        yourLabel.text = "\(firstNum3) ″"
                    }

                    else{
                        yourLabel.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 11)
                    }
                }
                else{
                    //firstNum3 = numArr3[0]
                    //yourLabel.text = "\(firstNum3)\""
                    yourLabel.text = TMWidth
                }
                
            }
        
        
        }
          else {
            yourLabel.text = TMWidth
        }
        
		yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
	}
	
	
	func drawShape() {
		
		let layer = CAShapeLayer()
		layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
		layer.fillColor = UIColor.clear.cgColor
		layer.lineWidth = 20
		layer.strokeColor = self.border.cgColor
		
		//		drawArea.addSubview(rectView)
		//drawArea.layer.addSublayer(layer)
		self.addLabels(frameRect)
		self.addLabels2(frameRect)
	}
	
	func addLabels(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
		yourLabel.textColor = updateContrastColor(selectedColor: .black)
		yourLabel.textAlignment = NSTextAlignment.center
//		yourLabel.text = self.wText
		//self.drawArea.addSubview(yourLabel)
	}
	
	func addLabels2(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
		yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
		yourLabel.textColor = updateContrastColor(selectedColor: .black)
		yourLabel.textAlignment = NSTextAlignment.center
		
//		yourLabel.text = self.hText
		
		yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
        
	}
    
}





