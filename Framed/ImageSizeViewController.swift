//
//  ImageSizeViewController.swift
//  Framed
//
//  Created by Dr. Atta on 02/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import DropDown
import ChainableAnimations
extension ImageSizeViewController{
	func drawShape() {
		
//		for view in self.drawArea.subviews{
//			view.removeFromSuperview()
//		}
		
		
//		let rectView = RectangleDrawingView(drawArea.bounds, self.tempRect, self.border)
//		rectView.bounds = drawArea.bounds
//		rectView.backgroundColor = UIColor.clear
		
		
//		let layer = CAShapeLayer()
//		layer.path = UIBezierPath.init(rect: self.tempRect).cgPath
//		layer.fillColor = UIColor.clear.cgColor
//		layer.lineWidth = 30
//		layer.strokeColor = self.border.cgColor

//		drawArea.addSubview(rectView)
		//drawArea.layer.addSublayer(layer)
        self.frameView.backgroundColor = self.border
		self.addLabels(tempRect)
		self.addLabels2(tempRect)
	}
	
	func addLabels(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
            //yourLabel.text = self.wText
            if UI_USER_INTERFACE_IDIOM() == .phone{
                
                self.lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
            else{
                
                self.lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: self.wText, color: updateContrastColor(selectedColor: self.border), size: 30)
            }
            
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.wText
            
            self.lblSMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMTFrameWidth.text = wText
        }

		//self.drawArea.addSubview(yourLabel)
	}
	
	func addLabels2(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
            //yourLabel.text = self.hText
            if UI_USER_INTERFACE_IDIOM() == .phone{
                
                self.lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
            else{
                
                self.lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: self.hText, color: updateContrastColor(selectedColor: self.border), size: 30)
            }
            
        }
        else{
//            lblSMLFrameHeight.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.hText
            
            self.lblSMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMLFrameHeight.text = hText
        }

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
        
		//yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
	}
}

class ImageSizeViewController: UIViewController {
	
	@IBOutlet weak var width: UITextField!
	@IBOutlet weak var widthDecimal: UIButton!
	
	@IBOutlet weak var height: UITextField!
	@IBOutlet weak var heightDecimal: UIButton!
	
	@IBOutlet weak var mapOverLap: UIButton!

	@IBOutlet weak var drawArea: UIView!
    
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
	
	var tempRect : CGRect!
	var tempWidth : Double = 0.0
	var tempHeight : Double = 0.0
	var hText : String = ""
	var wText : String = ""
	var border: UIColor!
	
	var imgRect : CGRect!
	var imgWidth : Double = 0.0
	var tempWD : Double = 0.0
	var imgHeight : Double = 0.0
	var tempHD : Double = 0.0
	var mapD : Double = 0.0
	var hT : String = ""
	var wT : String = ""
	var imgBorder = UIColor()
	
	let WD = DropDown()
	let HD = DropDown()
	let map = DropDown()
	
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
	
	var leftBarItems = [UIBarButtonItem]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setNavigationItems()
        // Do any additional setup after loading the view.
		setDecimalViews()
		HD.selectRow(at: 0)
		WD.selectRow(at: 0)
		map.selectRow(at: 0)
        self.imageView.isHidden = true
		drawShape()
    }

	@objc func toMatSelection(){
		if imgRect != nil{
		self.performSegue(withIdentifier: "toMatSelection", sender: nil)
		}
	}
	@objc func setSize() {
		print("SET SIZE")
		
		if let hval = height.text {
			if hval != "" && Double(hval) != nil{
				imgHeight = Double(hval)!
				imgHeight += tempHD
			}
			else{
				return
			}
		}
		if let hval = width.text {
			if hval != "" && Double(hval) != nil{
				imgWidth = Double(hval)!
				imgWidth += tempWD
			}
			else{
				return
			}
		}
		
		if ViewController.state.useInches{
			
			imgWidth *= 72
            //imgWidth *= 72
//			if imgWidth > Double(self.drawArea.bounds.width){
//				imgWidth = Double(self.drawArea.bounds.width) - 20
//			}
			
			imgHeight *= 72
            //imgHeight *= 72
//			if imgHeight > Double(self.drawArea.bounds.height){
//				imgHeight = Double(self.drawArea.bounds.height) - 20
//			}
		}
		else{
			
			imgWidth *= 28
            //imgWidth *= 28
//			if imgWidth > Double(self.drawArea.bounds.width){
//				imgWidth = Double(self.drawArea.bounds.width) - 20
//			}
			
			imgHeight *= 28
            //imgHeight *= 28
//			if imgHeight > Double(self.drawArea.bounds.height){
//				imgHeight = Double(self.drawArea.bounds.height) - 20
//			}
		}
//		imgHeight = round(imgHeight * 100) / 100
//		imgWidth = round(imgWidth * 100) / 100
		print("REACHED 1")
		
		if !(imgHeight > 0) || !(imgWidth > 0){
			print(imgHeight, imgWidth)
			return
		}
		
		print("REACHED 2")
		
		if !(imgHeight < tempHeight) || !(imgWidth < tempWidth) {
			let alert = UIAlertController.init(title: "Wrong Image Size", message: "Image size must be smaller than frame!", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
			self.present(alert, animated: true, completion: nil)
			return
		}
		
		if ViewController.state.useInches{
			
            var heightInInches = imgHeight/72
            //heightInInches = imgHeight/72
            var widthInInces = imgWidth / 72
            //widthInInces = imgWidth / 72
			
			var n = floor(heightInInches)
			var whole = Int(n)
			var fract = rationalApproximationOf(x0: round((heightInInches-n) * 100)/100)
			
			if fract.num == 0 {
				hT = "\(whole) ″"
			}
			else{
				hT = "\(whole) \(fract.num)/\(fract.den) ″"
			}
			n = floor(widthInInces)
			whole = Int(n)
			fract = rationalApproximationOf(x0: round((widthInInces-n) * 100)/100)
			if fract.num == 0 {
				wT = "\(whole) ″"
			}
			else{
				wT = "\(whole) \(fract.num)/\(fract.den) ″"
			}		}
		else{
            var heightInCM = imgHeight / 28
            //heightInCM = imgHeight / 28
            var widthInCM = imgWidth / 28
            //widthInCM = imgWidth / 28
			
			hT = "\(round(heightInCM * 100) / 100)cm"
			wT = "\(round(widthInCM * 100) / 100)cm"
			
		}
		print(tempHeight, tempWidth)
		print(imgHeight, imgWidth)
		
//		if (tempHeight - imgHeight) < 45{
//			self.imgHeight -= 45
//		}
//		if (tempWidth-imgWidth) < 45 {
//			self.imgWidth -= 45
//		}
//
//		if self.drawArea.layer.sublayers != nil{
//			for lay in (self.drawArea.layer.sublayers)!{
//				lay.removeFromSuperlayer()
//			}
//		}
		drawShape()
		drawImgShape()
        
        if let hval = height.text {
            if hval != "" && Double(hval) != nil{
                imgHeight = Double(hval)!
                imgHeight += tempHD
            }
            else{
                return
            }
        }
        if let hval = width.text {
            if hval != "" && Double(hval) != nil{
                imgWidth = Double(hval)!
                imgWidth += tempWD
            }
            else{
                return
            }
        }
        if ViewController.state.useInches{

            imgWidth *= 72

            imgHeight *= 72

        }
        else{

            imgWidth *= 28
            imgHeight *= 28

        }
	}
	
	@objc func goBack(){
		navigationController?.popViewController(animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	self.navigationController?.setNavigationBarHidden(false, animated: false)
		self.navigationController?.navigationBar.tintColor = .white
		self.navigationItem.title = "SET IMAGE SIZE"
		self.navigationItem.backBarButtonItem?.title = " "

		//		self.navigationItem.backBarButtonItem?.title = ""
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
	
	
	@IBAction func selectWidthDecimal(_ sender: UIButton) {
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
	
	@IBAction func selectMapOverlap(_ sender: UIButton) {
		if UI_USER_INTERFACE_IDIOM() == .pad{
            map.arrowIndicationX = CGFloat.init(20)
            map.textFont = UIFont.systemFont(ofSize: 32)
            map.cellHeight = 60
        }
        else{
            map.arrowIndicationX = CGFloat.init(10)
             map.cellHeight = 30
        }
		map.show()
	}
	
	func setDecimalViews(){
		setWidthDecimalDD()
		setHeightDecimalDD()
		setMapOverlapDD()
	}
	
	func setWidthDecimalDD(){
		WD.anchorView = widthDecimal
		WD.dismissMode = .onTap
		WD.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		WD.bottomOffset = CGPoint(x: 0, y: widthDecimal.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
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
			//			self?.widthDecimal.titleLabel?.text = "\(item) ▾"
			self?.widthDecimal.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.widthDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.widthDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tempWD = Double((self?.inDecimalData[index])!)
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
			//			self?.widthDecimal.titleLabel?.text = "\(item) ▾"
			self?.heightDecimal.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.heightDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.heightDecimal.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tempHD = Double((self?.inDecimalData[index])!)
				print(self?.inDecimalData[index])
				
			}
			else{
				self?.tempHD = Double((self?.cmDecimalData[index])!)
				print(self?.cmDecimalData[index])
				
			}
		}
	}
	
	
	func setMapOverlapDD(){
		map.anchorView = mapOverLap
		map.dismissMode = .onTap
		map.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		map.bottomOffset = CGPoint(x: 0, y: mapOverLap.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		if !ViewController.state.useInches{
			map.dataSource = self.cmDecDS
		}
		else{
			map.dataSource = self.inDecDS
            map.customCellConfiguration = {
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
		map.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal.titleLabel?.text = "\(item) ▾"
			self?.mapOverLap.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.mapOverLap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.mapOverLap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.mapD = Double((self?.inDecimalData[index])!)
				
			}
			else{
				self?.mapD = Double((self?.cmDecimalData[index])!)
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
	

	
	
	

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let nextController = segue.destination as? MatSelectionViewController{
			nextController.frameRect = self.tempRect
			nextController.frameWidth = self.tempWidth
			nextController.frameHeight = self.tempHeight
			nextController.imageRect = self.imgRect
			nextController.imageWidth = self.imgWidth
			nextController.imageHeight = self.imgHeight
			nextController.actualImageWidth = self.imgWidth
			nextController.actualImageHeight = self.imgHeight
			nextController.border = self.border
			if ViewController.state.useInches{
				nextController.mapOverLap = self.mapD * 72
			}
			else{
				nextController.mapOverLap = self.mapD * 28
			}
		}
    }


}

extension ImageSizeViewController{
	private func setNavigationItems(){
		self.navigationItem.backBarButtonItem?.title = " "
		
		self.navigationItem.title = "SET IMAGE SIZE"
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
		viewSetting()
	}
	
	private func setLeftBarButton(){
		
		self.navigationItem.backBarButtonItem?.title = ""
		
		if !(self.navigationItem.leftBarButtonItems?.count == 0) {
			self.navigationItem.leftBarButtonItems = nil
		}
		//		let leftbtn = UIBarButtonItem(image: #imageLiteral(resourceName: "png-Create-btn-8").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(create))
		
		let leftbtn = UIButton(type: .roundedRect)
		leftbtn.setImage(#imageLiteral(resourceName: "Set-btn").withRenderingMode(.alwaysOriginal), for: .normal)
		leftbtn.addTarget(self, action: #selector(setSize), for: .touchUpInside)
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
		
		self.navigationItem.hidesBackButton = true
		//
		//self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbtn)
		//		self.navigationItem.leftBarButtonItem = leftbtn
		
	}
	
	private func setRightBarButton(){
		
		let rightbtn = UIButton(type: .roundedRect)
		rightbtn.setImage(#imageLiteral(resourceName: "Next-btn").withRenderingMode(.alwaysOriginal), for: .normal)
		rightbtn.addTarget(self, action: #selector(toMatSelection), for: .touchUpInside)
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
		
		mapOverLap.layer.borderColor = navColor.cgColor
		mapOverLap.layer.borderWidth = CGFloat(1)
		mapOverLap.layer.cornerRadius = CGFloat(4)
	}
	
	typealias Rational = (num : Int, den : Int)
	

	
}

extension ImageSizeViewController{
	func drawImgShape() {
		
		imgRect = makeRandomRectangle()
	
		let layer = CAShapeLayer()
		layer.path = UIBezierPath.init(rect: self.imgRect).cgPath
		layer.fillColor = UIColor.clear.cgColor
		layer.lineWidth = 25
		layer.strokeColor = self.border.cgColor
		//self.drawArea.layer.addSublayer(layer)
        
        self.imageView.backgroundColor = self.border
        self.imageView.isHidden = false
		self.addImgLabels(imgRect)
		self.addImgLabels2(imgRect)
		
	}
	
	func makeRandomRectangle() -> CGRect{
		
		//		let w = Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1 - 15) % Int(self.drawArea.bounds.width)
		//
		//		let h = ( Int(arc4random_uniform(UInt32(self.drawArea.bounds.height) - 5) + 1) - 15) % Int(self.drawArea.bounds.width)
		
		var w = 0.0
		var h = 0.0
        if ViewController.state.useInches
        {
            self.imgWidth *= 72
            self.imgHeight *= 72
        }
        else
        {
            self.imgWidth *= 28
            self.imgHeight *= 28
        }
		if (tempRect.width - CGFloat(self.imgWidth)) < 90{
			w = Double(tempRect.width - 90)
		}else{
			w = imgWidth + 50
		}
		
		if (tempRect.height - CGFloat(self.imgHeight)) < 90{
			h = Double(tempRect.height - 90)
		}else{
			h = imgHeight + 50
		}
		
//		let w = round(imgWidth * 100) / 100
//		let h = round(imgHeight * 100) / 100
		
		
		
		let size = CGSize(width: w, height: h)
		let origin =  CGPoint(x: self.tempRect.midX - (size.width / 2), y: self.tempRect.midY - (size.height / 2))
		
		return CGRect(origin: origin, size: size)
	}
	
	func addImgLabels(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: orig.y - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
            //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //yourLabel.textAlignment = NSTextAlignment.center
            //yourLabel.attributedText = fractionMutableAttributedString(for: wT, color: updateContrastColor(selectedColor: self.border), size: 15)
            //yourLabel.text = wT
            if UI_USER_INTERFACE_IDIOM() == .phone{
             
                self.lblSMTImageWidth.attributedText = fractionMutableAttributedString(for: wT, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
            else{
                
                self.lblSMTImageWidth.attributedText = fractionMutableAttributedString(for: wT, color: updateContrastColor(selectedColor: self.border), size: 30)
            }
            
            
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = wT
            
            self.lblSMTImageWidth.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMTImageWidth.text = wT
        }
		//self.drawArea.addSubview(yourLabel)
	}
	
	func addImgLabels2(_ rect:CGRect){
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
        if ViewController.state.useInches{
            //yourLabel.textColor = updateContrastColor(selectedColor: self.border)
            //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.attributedText = fractionMutableAttributedString(for: hT, color: updateContrastColor(selectedColor: self.border), size: 15)
            //yourLabel.text = hT
            if UI_USER_INTERFACE_IDIOM() == .phone{
                
                self.lblSMLImageHeight.attributedText = fractionMutableAttributedString(for: hT, color: updateContrastColor(selectedColor: self.border), size: 15)
            }
            else{
                
                self.lblSMLImageHeight.attributedText = fractionMutableAttributedString(for: hT, color: updateContrastColor(selectedColor: self.border), size: 30)
            }
            
        }
        else{
//            yourLabel.textColor = updateContrastColor(selectedColor: self.border)
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = hT
            
            self.lblSMLImageHeight.textColor = updateContrastColor(selectedColor: self.border)
            self.lblSMLImageHeight.text = hT
        }
        
        if isFirstTimeImage{
            let point = CGSize(width: self.lblSMLImageHeight.frame.height , height: self.lblSMLImageHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLImageHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)

            //let point1 = CGSize(width: self.lblSMRImageHeight.frame.height , height: self.lblSMRImageHeight.frame.width)
            //let animatr1 = ChainableAnimator(view: self.lblSMRImageHeight)
            //animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            isFirstTimeImage = false
        }
		//yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
		//self.drawArea.addSubview(yourLabel)
	}
}
