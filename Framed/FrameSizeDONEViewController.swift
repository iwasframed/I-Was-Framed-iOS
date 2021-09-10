//
//  FrameSizeDONEViewController.swift
//  Framed
//
//  Created by Dr. Atta on 01/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import DropDown
import ChainableAnimations
extension FrameSizeDONEViewController{
	
func drawShape() {
//	if self.drawArea.layer.sublayers != nil{
//		for lay in (self.drawArea.layer.sublayers)!{
//			lay.removeFromSuperlayer()
//		}
//	}
	
//		for view in self.drawArea.subviews{
//			view.removeFromSuperview()
//		}

		let rectView = RectangleDrawingView(drawArea.bounds, self.tempRect, self.border)
		rectView.frame = self.drawArea.frame
		rectView.backgroundColor = UIColor.clear
//		drawArea.addSubview(rectView)

//		let layer = CAShapeLayer()
//		layer.path = UIBezierPath.init(rect: self.tempRect).cgPath
//		layer.fillColor = UIColor.clear.cgColor
//		layer.lineWidth = 30
//		layer.strokeColor = self.border.cgColor
//
//		drawArea.layer.addSublayer(layer)
    
        self.frameView.backgroundColor = self.border
		self.addLabels(tempRect)
		self.addLabels2(tempRect)
	}
	
	func addLabels(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
		//yourLabel.textAlignment = NSTextAlignment.center
		
        if ViewController.state.useInches{
            if self.wText.contains("/"){
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
            }
            else{
                lblSMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                lblSMTFrameWidth.text = self.wText
            }
            
        }
        else{
            lblSMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            lblSMTFrameWidth.text = self.wText
        }
		
		//self.drawArea.addSubview(yourLabel)
	}
	
	func addLabels2(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
		//yourLabel.textAlignment = NSTextAlignment.center
        if ViewController.state.useInches{
            if self.hText.contains("/"){
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
            }
            else{
                lblSMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                lblSMLFrameHeight.text = self.hText
            }
            
        }
        else{
            lblSMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            lblSMLFrameHeight.text = self.hText
        }
		if isFirstTimeFrame{
            
            let point = CGSize(width: self.lblSMLFrameHeight.frame.height , height: self.lblSMLFrameHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLFrameHeight)
            animatr.make(backgroundColor: self.border).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11){
                self.lblSMLFrameHeight.backgroundColor = .clear
            }
            
            
            //self.lblSMLFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            //self.lblSMRFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            
            
            //let point1 = CGSize(width: self.lblSMRFrameHeight.frame.height , height: self.lblSMRFrameHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblSMRFrameHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            isFirstTimeFrame = false
        }
		//yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
		//		let label2 = yourLabel
		//		label2.transform = CGAffineTransform(rotationAngle: -90)
		//		label2.frame.origin.x = orig.x - 15
		//		label2.frame.origin.y = rect.midY + self.view.frame.height/4
		//		self.drawArea.addSubview(label2)
	}
}


class FrameSizeDONEViewController: UIViewController {

	var tempRect : CGRect!
	var tempWidth : Double = 0.0
	var tempHeight : Double = 0.0
	
	var tempTop : Double = 0.0
	var tempTopD : Double = 0.0
	var tempBot : Double = 0.0
	var tempBotD : Double = 0.0
	var tempRight : Double = 0.0
	var tempRightD : Double = 0.0
	var tempLeft : Double = 0.0
	var tempLeftD : Double = 0.0
	
	var hText : String = ""
	var wText : String = ""
	var border: UIColor!
	
	var actualHeight: Double!
	var actualWidth: Double!
    
    @IBOutlet weak var lblSMTFrameWidth: UILabel!
    @IBOutlet weak var lblSMBFrameWidth: UILabel!
    @IBOutlet weak var lblSMLFrameHeight: UILabel!
    @IBOutlet weak var lblSMRFrameHeight: UILabel!
    @IBOutlet weak var lblSMTImageWidth: UILabel!
    @IBOutlet weak var lblSMBImageWidth: UILabel!
    @IBOutlet weak var lblSMLImageHeight: UILabel!
    @IBOutlet weak var lblSMRImageHeight: UILabel!

    
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var imageView: UIView!

    
    @IBOutlet weak var panelConstant: NSLayoutConstraint!
    
    var isFirstTimeFrame = true
    var isFirstTimeImage = true
	
	@IBOutlet weak var topDec: UIButton!
	@IBOutlet weak var top: UITextField!
	
	@IBOutlet weak var bottomDec: UIButton!
	@IBOutlet weak var bottom: UITextField!
	
	@IBOutlet weak var leftDec: UIButton!
	@IBOutlet weak var left: UITextField!
	
	@IBOutlet weak var rightDec: UIButton!
	@IBOutlet weak var right: UITextField!
	
	var wTop: DropDown = DropDown()
	var wBottom: DropDown = DropDown()
	
	var hLeft: DropDown = DropDown()
	var hRight: DropDown = DropDown()
	
	@IBOutlet weak var drawArea: UIView!
	
	
	var cmDecimalData: [Float] = [
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
	
	var inDecimalData: [Float] = [
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
	
	var cmDecDS = [
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
	var inDecDS = ["0","1/16","1/8","3/16","1/4","5/16","3/8","7/16","1/2","9/16","5/8","11/16","3/4","13/16","7/8","15/16"]
    override func viewDidLoad() {
        super.viewDidLoad()
		hLeft.selectRow(at: 0)
		hRight.selectRow(at: 0)
		wTop.selectRow(at: 0)
		wBottom.selectRow(at: 0)
		
		setNavigationItems()
		
        // Do any additional setup after loading the view.
		setDecimalViews()
		drawShape()

    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationItem.title = "SET BORDER SIZE"
		self.navigationItem.backBarButtonItem?.title = " "

		//self.navigationItem.backBarButtonItem?.title = ""
        if UI_USER_INTERFACE_IDIOM() == .pad{
                   if UIScreen.main.bounds.height <= 1030{
                       self.panelConstant.constant = self.view.frame.height / 10
                   }
                   else{
                       self.panelConstant.constant = self.view.frame.height / 12
                   }
               }
               else{
                   if UIScreen.main.bounds.height <= 800{
                       
                       self.panelConstant.constant = self.view.frame.height / 10
                   }
                   else{
                       
                       self.panelConstant.constant = self.view.frame.height / 12
                   }
                   

               }
        
		}
	
	@objc func createBorder() {
		print("Create Border")
		var height = actualHeight
		var width = actualWidth
		
		if let hval = left.text {
			if hval != "" && Double(hval) != nil{
				if ViewController.state.useInches{
					height! += (Double(hval)! * 72)
					height! += self.tempLeftD * 72
				}
				else{
					height! += (Double(hval)! * 28)
					height! += self.tempLeftD * 28
				}
			}
			else{
				return
			}
		}
		
		if let hval = right.text {
			if hval != "" && Double(hval) != nil{
				if ViewController.state.useInches{
					height! += (Double(hval)! * 72)
					height! += self.tempRightD * 72
				}
				else{
					height! += (Double(hval)! * 28)
					height! += self.tempRightD * 28
				}
			}
			else{
				return
			}
		}
		
		if let hval = top.text {
			if hval != "" && Double(hval) != nil{
				if ViewController.state.useInches{
					width! += (Double(hval)! * 72)
					width! += self.tempTopD * 72
				}
				else{
					width! += (Double(hval)! * 28)
					width! += self.tempTopD * 28
				}
			}
			else{
				return
			}
		}

		if let hval = bottom.text {
			if hval != "" && Double(hval) != nil{
				if ViewController.state.useInches{
				width! += (Double(hval)! * 72)
				width! += self.tempBotD * 72
				}
				else{
				width! += (Double(hval)! * 28)
				width! += self.tempBotD * 28
				}
			}
			else{
				return
			}
		}
		
		if ViewController.state.useInches{
			height! /= 72
            
            hText = String(format: "%f", height!)
			width! /= 72
            
            wText = String(format: "%f", width!)
		}
		else{
			height! /= 28
            
			hText = String(round(height! * 100)/100) + "cm"
			width! /= 28
            
			wText = String(round(width! * 100)/100) + "cm"
		}
		
		
		self.performSegue(withIdentifier: "toFrameResult", sender: nil)
	}
	
	@objc func goBack(){
	navigationController?.popViewController(animated: true)
	}
	
	@IBAction func selecTopDecimal(_ sender: UIButton) {
		if UI_USER_INTERFACE_IDIOM() == .pad{
            wTop.arrowIndicationX = CGFloat.init(20)
            wTop.textFont = UIFont.systemFont(ofSize: 32)
            wTop.cellHeight = 60
        }
        else{
            wTop.arrowIndicationX = CGFloat.init(10)
             wTop.cellHeight = 30
        }
		wTop.show()
	}
	
	@IBAction func selectBottomDecimal(_ sender: UIButton) {
		if UI_USER_INTERFACE_IDIOM() == .pad{
            wBottom.arrowIndicationX = CGFloat.init(20)
            wBottom.textFont = UIFont.systemFont(ofSize: 32)
            wBottom.cellHeight = 60
        }
        else{
            wBottom.arrowIndicationX = CGFloat.init(10)
             wBottom.cellHeight = 30
        }
		wBottom.show()
	}
	
	@IBAction func selectLeftDecimal(_ sender: UIButton) {
		if UI_USER_INTERFACE_IDIOM() == .pad{
            hLeft.arrowIndicationX = CGFloat.init(20)
            hLeft.textFont = UIFont.systemFont(ofSize: 32)
            hLeft.cellHeight = 60
        }
        else{
            hLeft.arrowIndicationX = CGFloat.init(10)
             hLeft.cellHeight = 30
        }
		hLeft.show()
	}
	
	@IBAction func selectRightDecimal(_ sender: UIButton) {
		if UI_USER_INTERFACE_IDIOM() == .pad{
            hRight.arrowIndicationX = CGFloat.init(20)
            hRight.textFont = UIFont.systemFont(ofSize: 32)
            hRight.cellHeight = 60
        }
        else{
            hRight.arrowIndicationX = CGFloat.init(10)
             hRight.cellHeight = 30
        }
		hRight.show()
	}
	
	
	
	func setDecimalViews(){
		setTopDecView()
		setBottomDecView()
		setRightDecView()
		setLeftDecView()
	}
	
	func setTopDecView(){
		wTop.anchorView = topDec
		wTop.dismissMode = .onTap
		wTop.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		wTop.bottomOffset = CGPoint(x: 0, y: topDec.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		if !ViewController.state.useInches{
			wTop.dataSource = self.cmDecDS
		}
		else{
			wTop.dataSource = self.inDecDS
            wTop.customCellConfiguration = {
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
		wTop.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal.titleLabel?.text = "\(item) ▾"
			self?.topDec.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.topDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.topDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tempTopD = Double((self?.inDecimalData[index])!)
	
			}
			else{
				self?.tempTopD = Double((self?.cmDecimalData[index])!)
	
				
			}
		}
	}
	
	func setBottomDecView(){
		wBottom.anchorView = bottomDec
		wBottom.dismissMode = .onTap
		wBottom.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		wBottom.bottomOffset = CGPoint(x: 0, y: bottomDec.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		if !ViewController.state.useInches{
			wBottom.dataSource = self.cmDecDS
		}
		else{
			wBottom.dataSource = self.inDecDS
            wBottom.customCellConfiguration = {
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
		wBottom.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal.titleLabel?.text = "\(item) ▾"
			self?.bottomDec.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.bottomDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.bottomDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tempBotD = Double((self?.inDecimalData[index])!)

			}
			else{
				self?.tempBotD = Double((self?.cmDecimalData[index])!)

			}
		}
	}
	
	func setLeftDecView(){
		hLeft.anchorView = leftDec
		hLeft.dismissMode = .onTap
		hLeft.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		hLeft.bottomOffset = CGPoint(x: 0, y: leftDec.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		if !ViewController.state.useInches{
		hLeft.dataSource = self.cmDecDS
		}
		else{
			hLeft.dataSource = self.inDecDS
            hLeft.customCellConfiguration = {
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
		hLeft.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal.titleLabel?.text = "\(item) ▾"
			self?.leftDec.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.leftDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.leftDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tempLeftD = Double((self?.inDecimalData[index])!)
		
			}
			else{
				self?.tempLeftD = Double((self?.cmDecimalData[index])!)
		
			}
		}
	}
	
	func setRightDecView(){
		hRight.anchorView = rightDec
		hRight.dismissMode = .onTap
		hLeft.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		hRight.bottomOffset = CGPoint(x: 0, y: rightDec.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		if !ViewController.state.useInches{
			hRight.dataSource = self.cmDecDS
		}
		else{
			hRight.dataSource = self.inDecDS
            hRight.customCellConfiguration = {
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
		hRight.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal.titleLabel?.text = "\(item) ▾"
			self?.rightDec.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.rightDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.rightDec.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tempRightD = Double((self?.inDecimalData[index])!)

				
			}
			else{
				self?.tempRightD = Double((self?.cmDecimalData[index])!)
	
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
    

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let nextController = segue.destination as? FrameResultViewController{
			nextController.tempRect = self.tempRect
			nextController.tempWidth = self.tempWidth
			
			nextController.tempHeight = self.actualHeight
			
			nextController.border = self.border
			nextController.wText = self.wText
			nextController.hText = self.hText
		}
		
    }

}


extension FrameSizeDONEViewController{
	private func setNavigationItems(){
		self.navigationItem.title = "SET BORDER SIZE"
		self.navigationItem.backBarButtonItem?.title = " "
        if UI_USER_INTERFACE_IDIOM() == .pad{
                   let navFrame = self.navigationController?.navigationBar.frame
                   self.navigationController?.navigationBar.frame = CGRect(x: (navFrame?.origin.x)!, y: (navFrame?.origin.y)!, width: navFrame!.width, height: 120)
                   self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)]
                   
               }
		setBackButton()
		setRightBarButton()
		viewSetting()
	}
	
	private func setBackButton(){
        
        let backBtn = UIButton(type: .custom)
            backBtn.setImage(#imageLiteral(resourceName: "Back-bar-btn").withRenderingMode(.alwaysOriginal), for: .normal)
            backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let w = backBtn.widthAnchor.constraint(equalToConstant: 100)
            w.isActive = true
            let h = backBtn.heightAnchor.constraint(equalToConstant: 50)
            h.isActive = true
            }
            else{
            let w = backBtn.widthAnchor.constraint(equalToConstant: 50)
            w.isActive = true
            let h = backBtn.heightAnchor.constraint(equalToConstant: 25)
            h.isActive = true
            }
		backBtn.frame.offsetBy(dx: -10, dy: 0)
		self.navigationItem.hidesBackButton = true
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
		
	}

	private func setRightBarButton(){
		
        let rightbtn = UIButton(type: .roundedRect)
        rightbtn.setImage(#imageLiteral(resourceName: "Create-btn").withRenderingMode(.alwaysOriginal), for: .normal)
        rightbtn.addTarget(self, action: #selector(createBorder), for: .touchUpInside)
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
	
	private func viewSetting(){
		let navColor = UIColor(hexString: "5C5338")
		
		top.layer.borderColor = navColor.cgColor
		top.layer.borderWidth = CGFloat(1)
		top.layer.cornerRadius = CGFloat(4)
		
		topDec.layer.borderColor = navColor.cgColor
		topDec.layer.borderWidth = CGFloat(1)
		topDec.layer.cornerRadius = CGFloat(4)
		
		bottom.layer.borderColor = navColor.cgColor
		bottom.layer.borderWidth = CGFloat(1)
		bottom.layer.cornerRadius = CGFloat(4)
		
		bottomDec.layer.borderColor = navColor.cgColor
		bottomDec.layer.borderWidth = CGFloat(1)
		bottomDec.layer.cornerRadius = CGFloat(4)
		
		left.layer.borderColor = navColor.cgColor
		left.layer.borderWidth = CGFloat(1)
		left.layer.cornerRadius = CGFloat(4)
		
		leftDec.layer.borderColor = navColor.cgColor
		leftDec.layer.borderWidth = CGFloat(1)
		leftDec.layer.cornerRadius = CGFloat(4)
		
		right.layer.borderColor = navColor.cgColor
		right.layer.borderWidth = CGFloat(1)
		right.layer.cornerRadius = CGFloat(4)
		
		rightDec.layer.borderColor = navColor.cgColor
		rightDec.layer.borderWidth = CGFloat(1)
		rightDec.layer.cornerRadius = CGFloat(4)
	}
	
}

