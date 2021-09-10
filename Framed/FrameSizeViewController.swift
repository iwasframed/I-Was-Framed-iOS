//
//  FrameSizeViewController.swift
//  Framed
//
//  Created by Dr. Atta on 01/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import DropDown
import ChainableAnimations

extension FrameSizeViewController{
	
	@IBAction func colorChanged(){
//		if tempRect == nil{
//			return
//		}
//
//		for view in self.drawArea.subviews{
//			view.removeFromSuperview()
//		}
		var bord_Color = UIColor.black
		
		switch  self.colorSelector.selectedSegmentIndex{
		case 0:
			bord_Color = UIColor(hexString: "EBD743")
		case 1:
			bord_Color = UIColor.black
		case 2:
			bord_Color = UIColor.lightGray
		case 3:
			bord_Color = UIColor.brown
		default:
			bord_Color = UIColor.yellow
		}
		self.border = bord_Color
		
		if tempRect == nil{
			return
		}
		
		let rectView = RectangleDrawingView(drawArea.bounds, tempRect, bord_Color)
		rectView.backgroundColor = UIColor.clear
		//drawArea.addSubview(rectView)
        self.frameViews.backgroundColor = self.border
        self.lblSMLFrameHeights.backgroundColor = self.border
		self.addLabels(tempRect)
		self.addLabels2(tempRect)
		
	}
	
	func drawShape() {
		
//		for view in self.drawArea.subviews{
//			view.removeFromSuperview()
//		}
		var bord_Color = UIColor.black
		
		switch  self.colorSelector.selectedSegmentIndex{
		case 0:
			bord_Color =  UIColor(hexString: "EBD743")

		case 1:
			bord_Color = UIColor.black
		case 2:
			bord_Color = UIColor.lightGray
		case 3:
			bord_Color = UIColor.brown
		default:
			bord_Color = UIColor.yellow
		}
		self.border = bord_Color
		tempRect = makeRandomRectangle()
		let rectView = RectangleDrawingView(drawArea.bounds, tempRect, bord_Color)
		rectView.backgroundColor = UIColor.clear
//		drawArea.addSubview(rectView)
        self.frameViews.backgroundColor = self.border
        self.frameViews.isHidden = false
		self.addLabels(tempRect)
		self.addLabels2(tempRect)
	}
	
	func makeRandomRectangle() -> CGRect{
		
//		let w = Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1 - 15) % Int(self.drawArea.bounds.width)
//
//		let h = ( Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1) - 15) % Int(self.drawArea.bounds.width)
		let w = round(tempWidth * 100) / 100
		let h = round(tempHeight * 100) / 100
		let size = CGSize(width: w, height: h)
		let origin =  CGPoint(x: self.drawArea.bounds.midX - (size.width / 2), y: self.drawArea.bounds.midY - (size.height / 2))
		
		return CGRect(origin: origin, size: size)
	}
	
    func addLabels(_ rect:CGRect){
		//let orig = rect.origin
	//	let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 12, width: self.view.frame.width/2, height: 30))
		//yourLabel.backgroundColor = UIColor.clear

		//yourLabel.textAlignment = NSTextAlignment.center
//		if ViewController.state.useInches{
//			if (WD.selectedItem != nil) && WD.selectedItem != "0"{
//				yourLabel.text = self.width.text! + " " + WD.selectedItem! + "\""
//				wText = self.width.text! + " " + WD.selectedItem! + "\""
//			}
//			else{
//				yourLabel.text = self.width.text! + "\""
//				wText = self.width.text! + "\""
//
//			}
////			yourLabel.text = self.wText + "\""
//		}else{
//			yourLabel.text = self.wText + "cm"
////			wText += "cm"
//		}
		
        if ViewController.state.useInches{
            
            if tempWText.contains("/"){
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    lblSMTFrameWidths.attributedText = fractionMutableAttributedString(for: tempWText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    lblSMTFrameWidths.attributedText = fractionMutableAttributedString(for: tempWText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
            }
            else{
                lblSMTFrameWidths.textColor = updateContrastColor(selectedColor: self.border)
                lblSMTFrameWidths.text = tempWText
            }
        }
        else{
            lblSMTFrameWidths.textColor = updateContrastColor(selectedColor: self.border)
            lblSMTFrameWidths.text = tempWText
        }
		//self.drawArea.addSubview(yourLabel)
	}

    func addLabels2(_ rect:CGRect){
		//let orig = rect.origin
		//let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 3, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
		//yourLabel.backgroundColor = UIColor.clear

		//yourLabel.textAlignment = NSTextAlignment.center
//		if ViewController.state.useInches{
//			if (HD.selectedItem != nil) && HD.selectedItem != "0" {
//				yourLabel.text = self.height.text! + " " + HD.selectedItem! + "\""
//				hText = self.height.text! + " " + HD.selectedItem! + "\""
//			}
//			else{
//				yourLabel.text = self.height.text! + "\""
//				hText = self.height.text! + "\""
//			}
////			yourLabel.text = self.hText + "\""
//		}else{
////			tempHeight = round(tempHeight * 100) / 100
//			yourLabel.text = self.hText + "cm"
////			self.hText += "cm"
//		}
		
        if ViewController.state.useInches{
            
            if tempHText.contains("/")
            {
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    lblSMLFrameHeights.attributedText = fractionMutableAttributedString(for: tempHText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    lblSMLFrameHeights.attributedText = fractionMutableAttributedString(for: tempHText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
            }
            else{
                lblSMLFrameHeights.textColor = updateContrastColor(selectedColor: self.border)
                lblSMLFrameHeights.text = tempHText
            }
        }
        else{
            lblSMLFrameHeights.textColor = updateContrastColor(selectedColor: self.border)
            lblSMLFrameHeights.text = tempHText
        }
        if isFirstTimeFrames{
            
            let point = CGSize(width: self.lblSMLFrameHeights.frame.height , height: self.lblSMLFrameHeights.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLFrameHeights)
            animatr.make(backgroundColor: self.border).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11){
                self.lblSMLFrameHeights.backgroundColor = .clear
            }
            //self.lblSMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            //self.lblSMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            
            
            //let point1 = CGSize(width: self.lblSMRFrameHeight.frame.height , height: self.lblSMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblSMRFrameHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            isFirstTimeFrames = false
        }
        
		//yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//		self.drawArea.addSubview(yourLabel)
		//		let label2 = yourLabel
		//		label2.transform = CGAffineTransform(rotationAngle: -90)
		//		label2.frame.origin.x = orig.x - 15
		//		label2.frame.origin.y = rect.midY + self.view.frame.height/4
		//		self.drawArea.addSubview(label2)
	}
	

}

class FrameSizeViewController: UIViewController {
	
	var tempRect : CGRect!
	var tempWidth : Double = 0.0
	var tempWD : Double = 0.0
	var tempHeight : Double = 0.0
	var tempHD : Double = 0.0
	var hText : String = ""
	var wText : String = ""
	var tempHText: String = ""
	var tempWText: String = ""
	var border: UIColor!
	
	var actualHeight : Double = 0.0
	var actualWidth : Double = 0.0
	
	@IBOutlet weak var width: UITextField!
	
	@IBOutlet weak var height: UITextField!
	
	@IBOutlet weak var widthDecimal: UIButton!
	
	@IBOutlet weak var heightDecimal: UIButton!
	
	@IBOutlet weak var colorSelector: UISegmentedControl!
	
	@IBOutlet weak var drawArea: UIView!
    
    
    @IBOutlet weak var lblSMTFrameWidths: UILabel!
    @IBOutlet weak var lblSMBFrameWidths: UILabel!
    @IBOutlet weak var lblSMLFrameHeights: UILabel!
    @IBOutlet weak var lblSMRFrameHeights: UILabel!


    
    @IBOutlet weak var frameViews: UIView!

    
    @IBOutlet weak var panelConstants: NSLayoutConstraint!
    
    var isFirstTimeFrames = true
	
	
	let WD = DropDown()
	let HD = DropDown()
	
	
	let cmDecimalData: [Float] = [
		0,
		0.16,
		0.32,
		0.48,
		0.64,
		0.79,
		0.95,
		1.11,
		1.27,
		1.43,
		1.59,
		1.75,
		1.91,
		2.06,
		2.22,
		2.38
	]
	
	let inDecimalData: [Float] = [
		0,
		0.0625,
		0.125,
		0.1875,
		0.25,
		0.3125,
		0.375,
		0.4375,
		0.5,
		0.5625,
		0.625,
		0.6875,
		0.75,
		0.8125,
		0.875,
		0.9375
	]
	
	let cmDecDS: [String] = [
		"0",
		"0.16",
		"0.32",
		"0.48",
		"0.64",
		"0.79",
		"0.95",
		"1.11",
		"1.27",
		"1.43",
		"1.59",
		"1.75",
		"1.91",
		"2.06",
		"2.22",
		"2.38"
	]
	let inDecDS: [String] = ["0","1/16","1/8","3/16","1/4","5/16","3/8","7/16","1/2","9/16","5/8","11/16","3/4","13/16","7/8","15/16"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
	
		setNavigationItems()
        // Do any additional setup after loading the view.
		setDecimalViews()
		WD.selectRow(at: 0)
		HD.selectRow(at: 0)
        self.frameViews.isHidden = true
    }
	
	@IBAction func panBack(_ sender: UIScreenEdgePanGestureRecognizer) {
	navigationController?.popViewController(animated: true)
	}

	@objc func toAddBorderScreen(){
		if tempRect != nil {
            self.performSegue(withIdentifier: "toCalculateFrameFinal", sender: nil)
		}
	}
	
	@objc func create(sender: UIButton) {
		print("Create")
		if let hval = height.text {
			if hval != "" && Double(hval) != nil{
				tempHeight = Double(hval)!
				tempHeight += tempHD
			}
			else{
				return
			}
		}
		if let hval = width.text {
			if hval != "" && Double(hval) != nil{
				tempWidth = Double(hval)!
				tempWidth += tempWD
			}
			else{
				return
			}
		}
		
		if ViewController.state.useInches{
			
			tempWidth *= 72
            tempWidth *= 72
			actualWidth = tempWidth
			if tempWidth > Double(self.drawArea.bounds.width){
				tempWidth = Double(self.drawArea.bounds.width) - 20
			}
			
			tempHeight *= 72
            tempHeight *= 72
			actualHeight = tempHeight
			if tempHeight > Double(self.drawArea.bounds.height){
				tempHeight = Double(self.drawArea.bounds.height) - 20
			}
		}
		else{
			self.wText = "\(round(tempWidth * 100)/100)"
			tempWidth *= 28
            tempWidth *= 28
			actualWidth = tempWidth
			if tempWidth > Double(self.drawArea.bounds.width){
				tempWidth = Double(self.drawArea.bounds.width) - 20
			}
			self.hText = "\(round(tempHeight * 100)/100)"
			tempHeight *= 28
            tempHeight *= 28
			actualHeight = tempHeight
			if tempHeight > Double(self.drawArea.bounds.height){
				tempHeight = Double(self.drawArea.bounds.height) - 20
			}
		}
		tempHeight = round(tempHeight * 100) / 100
		tempWidth = round(tempWidth * 100) / 100
		if !(tempHeight > 0) || !(tempWidth > 0){
			return
		}
		
		if ViewController.state.useInches{
			if (WD.selectedItem != nil) && WD.selectedItem != "0"{
				tempWText = self.width.text! + " " + WD.selectedItem! + " ″"
				wText = self.width.text! + " " + WD.selectedItem! + " ″"
			}
			else{
				tempWText = self.width.text! + "″"
				wText = self.width.text! + "″"
				
			}
			//			yourLabel.text = self.wText + "\""
			if (HD.selectedItem != nil) && HD.selectedItem != "0" {
				tempHText = self.height.text! + " " + HD.selectedItem! + " ″"
				hText = self.height.text! + " " + HD.selectedItem! + " ″"
			}
			else{
				tempHText = self.height.text! + "″"
				hText = self.height.text! + "″"
			}
			
			
		}else{
			tempWText = self.wText + "cm"
			tempHText = self.hText + "cm"
			//			wText += "cm"
		}
		
//		if self.drawArea.layer.sublayers != nil{
//		for lay in (self.drawArea.layer.sublayers)!{
//			lay.removeFromSuperlayer()
//			}
//		}
		drawShape()
        if let hval = height.text {
            if hval != "" && Double(hval) != nil{
                tempHeight = Double(hval)!
                tempHeight += tempHD
            }
            else{
                return
            }
        }
        if let hval = width.text {
            if hval != "" && Double(hval) != nil{
                tempWidth = Double(hval)!
                tempWidth += tempWD
            }
            else{
                return
            }
        }
        if ViewController.state.useInches{
            tempWidth *= 72
            actualWidth = tempWidth
            tempHeight *= 72
            actualHeight = tempHeight
            
        }
        else{
            tempWidth *= 28
            actualWidth = tempWidth
            tempHeight *= 28
            actualHeight = tempHeight
        }
	}
	
	@objc func goBack(){
	navigationController?.popViewController(animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setNavigationBarHidden(false, animated: false)
		self.navigationController?.navigationBar.tintColor = .white
		self.navigationItem.title = "SET WINDOWS SIZE"
		
		self.navigationItem.backBarButtonItem?.title = " "
        
        if UI_USER_INTERFACE_IDIOM() == .pad{
            colorSelector.stateNormalFonts(size: 32)
            if UIScreen.main.bounds.height <= 1030{
                self.panelConstants.constant = self.view.frame.height / 5
            }
            else{
                self.panelConstants.constant = self.view.frame.height / 6
            }
            
        }
        else{
            if UIScreen.main.bounds.height <= 800{
                
                self.panelConstants.constant = self.view.frame.height / 5
            }
            else{
                
                self.panelConstants.constant = self.view.frame.height / 6
            }
        }
		
	}

	
	@IBAction func selectWidthDecimal(_ sender: UIButton) {
	height.resignFirstResponder()
	width.resignFirstResponder()
		if UI_USER_INTERFACE_IDIOM() == .pad{
            WD.arrowIndicationX = CGFloat.init(20)
            WD.textFont = UIFont.systemFont(ofSize: 32)
            WD.cellHeight = 60
        }
        else{
            WD.arrowIndicationX = CGFloat.init(10)
             WD.cellHeight = 30
        }
		WD.show()
	}
	
	
	@IBAction func selectHeightDecimal(_ sender: UIButton) {
	height.resignFirstResponder()
	width.resignFirstResponder()
		if UI_USER_INTERFACE_IDIOM() == .pad{
            HD.arrowIndicationX = CGFloat.init(20)
            HD.textFont = UIFont.systemFont(ofSize: 32)
            HD.cellHeight = 60
        }
        else{
            HD.arrowIndicationX = CGFloat.init(10)
             HD.cellHeight = 30
        }
		HD.show()
	}
	
	func setDecimalViews(){
		setWidthDecimalDD()
		setHeightDecimalDD()
	}
	
	func setWidthDecimalDD(){
            WD.anchorView = widthDecimal
            WD.dismissMode = .onTap
            WD.direction = .any
            // By default, the dropdown will have its origin on the top left corner of its anchor view
            // So it will come over the anchor view and hide it completely
            // If you want to have the dropdown underneath your anchor view, you can do this:
            WD.bottomOffset = CGPoint(x: 0, y: widthDecimal.bounds.height)
            
            if !ViewController.state.useInches{
                WD.dataSource = self.cmDecDS
            }
            else{
                WD.dataSource = self.inDecDS
                WD.customCellConfiguration = {
                    (index: Index, item: String, cell: DropDownCell) -> Void in
                    //guard let cell = cell else { return }
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        // Setup your custom UI components
                        cell.optionLabel.attributedText = self.fractionMutableAttributedString1(for: item, color: .black, size: 15)
                    }
                    else{
                        // Setup your custom UI components
                        cell.optionLabel.attributedText = self.fractionMutableAttributedString1(for: item, color: .black, size: 30)
                    }
                    
                }
            }
            
            // Action triggered on selection
            WD.selectionAction = { [weak self] (index, item) in
                //            self?.widthDecimal.titleLabel?.text = "\(item) ▾"
                self?.widthDecimal.titleLabel?.tintColor = .black
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self?.widthDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
                }
                else{
                    self?.widthDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
                }
                if ViewController.state.useInches{
                    self?.tempWD = Double((self?.inDecimalData[index])!)
                    self?.wText = (self?.width.text)!
                    print(self?.inDecimalData[index])
                    
                }
                else{
                    self?.tempWD = Double((self?.cmDecimalData[index])!)
                    print(self?.cmDecimalData[index])
                    
                }
                
            }
            
        }
        
        func setHeightDecimalDD(){
            HD.anchorView = heightDecimal
            HD.dismissMode = .onTap
            HD.direction = .any
            // By default, the dropdown will have its origin on the top left corner of its anchor view
            // So it will come over the anchor view and hide it completely
            // If you want to have the dropdown underneath your anchor view, you can do this:
            HD.bottomOffset = CGPoint(x: 0, y: heightDecimal.bounds.height)
            
            // You can also use localizationKeysDataSource instead. Check the docs.
            if !ViewController.state.useInches{
                HD.dataSource = self.cmDecDS
            }
            else{
                HD.dataSource = self.inDecDS
                HD.customCellConfiguration = {
                    (index: Index, item: String, cell: DropDownCell) -> Void in
                    //guard let cell = cell else { return }
                    
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        // Setup your custom UI components
                        cell.optionLabel.attributedText = self.fractionMutableAttributedString1(for: item, color: .black, size: 15)
                    }
                    else{
                        // Setup your custom UI components
                        cell.optionLabel.attributedText = self.fractionMutableAttributedString1(for: item, color: .black, size: 30)
                    }
                    
                }
            }
            
            // Action triggered on selection
            HD.selectionAction = { [weak self] (index, item) in
                //            self?.widthDecimal.titleLabel?.text = "\(item) ▾"
                self?.heightDecimal.titleLabel?.tintColor = .black
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self?.heightDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
                }
                else{
                    self?.heightDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
                }
                
                if ViewController.state.useInches{
                    self?.tempHD = Double((self?.inDecimalData[index])!)
                    self?.hText = (self?.height.text)!
                    print(self?.inDecimalData[index])
                    
                }
                else{
                    self?.tempHD = Double((self?.cmDecimalData[index])!)
                    print(self?.cmDecimalData[index])
                    
                }
                
            }
        }

	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
		
	}
	
	
//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let nextController = segue.destination as? FrameSizeDONEViewController{
			nextController.tempRect = self.tempRect
			nextController.tempWidth = self.tempWidth
//			nextController.tempWD = self.tempWD
			nextController.tempHeight = self.tempHeight
//			nextController.tempHD = self.tempHD
			nextController.actualHeight = self.actualHeight
			nextController.actualWidth = self.actualWidth
			
			nextController.border = self.border
			if ViewController.state.useInches {
				nextController.wText = self.wText
				nextController.hText = self.hText
			}else{
				nextController.wText = self.wText + "cm"
				nextController.hText = self.hText + "cm"
			}
		}
	}
}
extension FrameSizeViewController{
	private func setNavigationItems(){
		self.navigationItem.title = "SET WINDOWS SIZE"
		self.navigationController?.setNavigationBarHidden(false, animated: false)
		self.navigationItem.leftItemsSupplementBackButton = true
//		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .done, target: self, action: #selector(toAddBorderScreen))
        if UI_USER_INTERFACE_IDIOM() == .pad{
                   let navFrame = self.navigationController?.navigationBar.frame
                   self.navigationController?.navigationBar.frame = CGRect(x: (navFrame?.origin.x)!, y: (navFrame?.origin.y)!, width: navFrame!.width, height: 120)
                   self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)]
                   
               }
		setRightBarButton()
		setLeftBarButton()
		viewSettings()
	}
	
	private func setLeftBarButton(){
		if !(self.navigationItem.leftBarButtonItems?.count == 0) {
			self.navigationItem.leftBarButtonItems = nil
		}
		self.navigationItem.backBarButtonItem?.title = " "

		//		let leftbtn = UIBarButtonItem(image: #imageLiteral(resourceName: "png-Create-btn-8").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(create))
		
        let leftbtn = UIButton(type: .roundedRect)
                leftbtn.setImage(#imageLiteral(resourceName: "Create-btn").withRenderingMode(.alwaysOriginal), for: .normal)
                leftbtn.addTarget(self, action: #selector(create), for: .touchUpInside)
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
                
                
        //        leftbtn.imageEdgeInsets.left = 10
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
		
		self.navigationItem.hidesBackButton = true
//		self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbtn)
		
		//		self.navigationItem.leftBarButtonItem = leftbtn
		
	}
	
	private func setRightBarButton(){
		
		let rightbtn = UIButton(type: .roundedRect)
        rightbtn.setImage(#imageLiteral(resourceName: "Next-btn").withRenderingMode(.alwaysOriginal), for: .normal)
        rightbtn.addTarget(self, action: #selector(toAddBorderScreen), for: .touchUpInside)
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
		
		//		self.navigationItem.leftBarButtonItem = leftbtn
	}
	
	private func viewSettings(){
		let navColor = UIColor(hexString: "5C5338")
		colorSelector.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.init(name: "Exo-Bold", size: CGFloat.init(15)) as Any], for: UIControlState.normal)
		colorSelector.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: UIControlState.selected)
		colorSelector.layer.borderColor = navColor.cgColor
		colorSelector.layer.borderWidth = CGFloat(2)
		colorSelector.layer.cornerRadius = CGFloat(4)
		
		width.layer.borderColor = navColor.cgColor
		width.layer.borderWidth = CGFloat(1)
		width.layer.cornerRadius = CGFloat(4)
		
		widthDecimal.layer.borderColor = navColor.cgColor
		widthDecimal.layer.borderWidth = CGFloat(1)
		widthDecimal.layer.cornerRadius = CGFloat(4)
		
		
		height.layer.borderColor = navColor.cgColor
		height.layer.borderWidth = CGFloat(1)
		height.layer.cornerRadius = CGFloat(4)
		
		heightDecimal.layer.borderColor = navColor.cgColor
		heightDecimal.layer.borderWidth = CGFloat(1)
		heightDecimal.layer.cornerRadius = CGFloat(4)
	}
	
}



extension UIColor {
	
	convenience init(hexString: String) {
		let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int = UInt32()
		Scanner(string: hex).scanHexInt32(&int)
		let a, r, g, b: UInt32
		switch hex.count {
		case 3: // RGB (12-bit)
			(a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
		case 6: // RGB (24-bit)
			(a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
		case 8: // ARGB (32-bit)
			(a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
		default:
			(a, r, g, b) = (255, 0, 0, 0)
		}
		self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
	}
}


