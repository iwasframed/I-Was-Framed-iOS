//
//  MatSelectionViewController.swift
//  Framed
//
//  Created by Dr. Atta on 02/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import DropDown

class MatSelectionViewController: UIViewController {
	
	// MARK: - Variable Declarations
	@IBOutlet weak var matSelectorBtnGroup: UISegmentedControl!
	
	@IBOutlet weak var doubleMatView: UIView!
	
	@IBOutlet weak var tripleMatView: UIView!
	
	@IBOutlet weak var doubleBottomField: UITextField!
	@IBOutlet weak var doubleBottomMap: UIButton!
	let doubleBottomDD = DropDown()
	
	@IBOutlet weak var tripleMidField: UITextField!
	@IBOutlet weak var tripleMidMap: UIButton!
	let tripleMidDD = DropDown()

	
	@IBOutlet weak var tripleBottomField: UITextField!
	@IBOutlet weak var tripleBottomMap: UIButton!
	let tripleBottomDD = DropDown()
	
	var frameRect : CGRect!
	var frameWidth: Double!
	var frameHeight: Double!
	var imageRect : CGRect!
	var imageWidth: Double!
	var imageHeight: Double!
	var actualImageHeight : Double!
	var actualImageWidth : Double!
	
	var newH : Double = 0.0
	var newW : Double = 0.0
	
	var mapOverLap:Double!
	var border: UIColor!
	
	var matState : Int = 0
	
	var doubleBottom : Double = 0.0
	var tripleMiddle : Double = 0.0
	var tripleBottom : Double = 0.0
	var doubleBottomDVal : Double = 0.0
	var tripleMiddleDVal : Double = 0.0
	var tripleBottomDVal : Double = 0.0
	
	var iWidth : Double = 0.0
	var iHeight : Double = 0.0
	
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
	
	// MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

		setNavigationItems()
		// Do any additional setup after loading the view.
		
		doubleMatView.isHidden = true
		tripleMatView.isHidden = true
		
		doubleBottomDD.selectRow(at: 0)
		tripleMidDD.selectRow(at: 0)
		tripleBottomDD.selectRow(at: 0)
		
		setDecimalViews()
    }
	
	@objc func toResults(){
        
            if matState == 0{
                singleMatCalculate()
                self.performSegue(withIdentifier: "toResults", sender: nil)
            }else if matState == 1{
                if doubleMatCalculate(){
                    self.performSegue(withIdentifier: "toDoubleMat", sender: nil)
                }
                else {return}
            }else{
                if tripleMatCalculate(){
                    self.performSegue(withIdentifier: "toTripleMat", sender: nil)
                }
                else {return}
            }
        

		

		
	}
	
	@objc func goBack(){	navigationController?.popViewController(animated: true)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationItem.title = "MAT SELECTION"
		self.navigationController?.setNavigationBarHidden(false, animated:
			false)
        if UI_USER_INTERFACE_IDIOM() == .pad{
            matSelectorBtnGroup.stateNormalFonts(size: 32)
        }
        
	}
	
	@IBAction func viewToShow(_ sender: UISegmentedControl) {
		if matSelectorBtnGroup.selectedSegmentIndex == 0 {
			doubleMatView.isHidden = true
			tripleMatView.isHidden = true
			matState = 0
		}
		else if matSelectorBtnGroup.selectedSegmentIndex == 1 {
			doubleMatView.isHidden = false
			tripleMatView.isHidden = true
			matState = 1
		}
		else{
			doubleMatView.isHidden = true
			tripleMatView.isHidden = false
			matState = 2
		}
	}
	
	@IBAction func doubleBottomMapSelection(_ sender: UIButton) {
        if UI_USER_INTERFACE_IDIOM() == .pad{
            doubleBottomDD.arrowIndicationX = CGFloat.init(20)
            doubleBottomDD.textFont = UIFont.systemFont(ofSize: 32)
            doubleBottomDD.cellHeight = 60
        }
        else{
            doubleBottomDD.arrowIndicationX = CGFloat.init(10)
             doubleBottomDD.cellHeight = 30
        }
		doubleBottomDD.show()
	}
	
	@IBAction func tripleMidMapSelection(_ sender: UIButton) {
	if UI_USER_INTERFACE_IDIOM() == .pad{
        tripleMidDD.arrowIndicationX = CGFloat.init(20)
        tripleMidDD.textFont = UIFont.systemFont(ofSize: 32)
        tripleMidDD.cellHeight = 60
    }
    else{
        tripleMidDD.arrowIndicationX = CGFloat.init(10)
         tripleMidDD.cellHeight = 30
    }
	tripleMidDD.show()
	}
	
	@IBAction func tripleBottomMapSelection(_ sender: UIButton) {
	if UI_USER_INTERFACE_IDIOM() == .pad{
        tripleBottomDD.arrowIndicationX = CGFloat.init(20)
        tripleBottomDD.textFont = UIFont.systemFont(ofSize: 32)
        tripleBottomDD.cellHeight = 60
    }
    else{
        tripleBottomDD.arrowIndicationX = CGFloat.init(10)
         tripleBottomDD.cellHeight = 30
    }
		tripleBottomDD.show()

	}
	
	
	func setDecimalViews(){
		doubleBottomMapSetDD()
		tripleMidMapSetDD()
		tripleBottomMapSetDD()
	}
	
	func doubleBottomMapSetDD(){
	
	doubleBottomDD.anchorView = doubleBottomMap
	doubleBottomDD.dismissMode = .onTap
	doubleBottomDD.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		doubleBottomDD.bottomOffset = CGPoint(x: 0, y: doubleBottomMap.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		
		if !ViewController.state.useInches{
			doubleBottomDD.dataSource = self.cmDecDS
		}
		else{
			doubleBottomDD.dataSource = self.inDecDS
            doubleBottomDD.customCellConfiguration = {
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
		doubleBottomDD.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal1.titleLabel?.text = "\(item) ▾"
			self?.doubleBottomMap.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.doubleBottomMap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.doubleBottomMap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.doubleBottomDVal = Double((self?.inDecimalData[index])!)
			}
			else{
				self?.doubleBottomDVal = Double((self?.cmDecimalData[index])!)
			}
		}
	}
	
	func tripleMidMapSetDD(){
		tripleMidDD.anchorView = tripleMidMap
		tripleMidDD.dismissMode = .onTap
		tripleMidDD.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		tripleMidDD.bottomOffset = CGPoint(x: 0, y: tripleMidMap.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		
		if !ViewController.state.useInches{
			tripleMidDD.dataSource = self.cmDecDS
		}
		else{
			tripleMidDD.dataSource = self.inDecDS
            tripleMidDD.customCellConfiguration = {
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
		tripleMidDD.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal1.titleLabel?.text = "\(item) ▾"
			self?.tripleMidMap.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.tripleMidMap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.tripleMidMap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tripleMiddleDVal = Double((self?.inDecimalData[index])!)
			}
			else{
				self?.tripleMiddleDVal = Double((self?.cmDecimalData[index])!)
			}
			
		}
	}
	
	func tripleBottomMapSetDD(){
		
		tripleBottomDD.anchorView = tripleBottomMap
		tripleBottomDD.dismissMode = .onTap
		tripleBottomDD.direction = .any
		// By default, the dropdown will have its origin on the top left corner of its anchor view
		// So it will come over the anchor view and hide it completely
		// If you want to have the dropdown underneath your anchor view, you can do this:
		tripleBottomDD.bottomOffset = CGPoint(x: 0, y: tripleBottomMap.bounds.height)
		
		// You can also use localizationKeysDataSource instead. Check the docs.
		if !ViewController.state.useInches{
			tripleBottomDD.dataSource = self.cmDecDS
		}
		else{
			tripleBottomDD.dataSource = self.inDecDS
            tripleBottomDD.customCellConfiguration = {
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
		tripleBottomDD.selectionAction = { [weak self] (index, item) in
			//			self?.widthDecimal1.titleLabel?.text = "\(item) ▾"
			self?.tripleBottomMap.titleLabel?.tintColor = .black
			if UI_USER_INTERFACE_IDIOM() == .phone{
                self?.tripleBottomMap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 15), for: .normal)
            }
            else{
                self?.tripleBottomMap.setAttributedTitle(self?.fractionMutableAttributedString1(for: "\(item) ▾", color: .black, size: 30), for: .normal)
            }
			if ViewController.state.useInches{
				self?.tripleBottomDVal = Double((self?.inDecimalData[index])!)
			}
			else{
				self?.tripleBottomDVal = Double((self?.cmDecimalData[index])!)
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
		if let nextController = segue.destination as? ResultsViewController{
			nextController.oLap = self.mapOverLap
			nextController.doubleBottom = self.doubleBottom
			nextController.tripleMiddle = self.tripleMiddle
			nextController.tripleBottom = self.tripleBottom
			nextController.matState = self.matState
			nextController.frameRect = self.frameRect
			nextController.frameHeight = frameHeight
			nextController.frameWidth = frameWidth
			if matState == 0 {
				nextController.iHeight = self.actualImageHeight
				nextController.iWidth = self.actualImageWidth
			}else{
			nextController.iHeight = self.imageHeight
			nextController.iWidth = self.imageWidth
			}
			nextController.imageRect = self.imageRect
			nextController.actualImageWidth = self.actualImageWidth
			nextController.actualImageHeight = self.actualImageHeight
			
			nextController.h = self.newH
			nextController.w = self.newW
			nextController.border = border
            nextController.isFirstTimeImage = true
            nextController.isFirstTimeOlapLeft = true
            nextController.isFirstTimeOlapRight = true
            nextController.isFirstTimeFrame = true
		}
        else if let nextController = segue.destination as? DoubleMatResultViewController{
            nextController.oLap = self.mapOverLap
            nextController.doubleBottom = self.doubleBottom
            nextController.tripleMiddle = self.tripleMiddle
            nextController.tripleBottom = self.tripleBottom
            nextController.matState = self.matState
            nextController.frameRect = self.frameRect
            nextController.frameHeight = frameHeight
            nextController.frameWidth = frameWidth
            if matState == 0 {
                nextController.iHeight = self.actualImageHeight
                nextController.iWidth = self.actualImageWidth
            }else{
                nextController.iHeight = self.imageHeight
                nextController.iWidth = self.imageWidth
            }
            nextController.imageRect = self.imageRect
            nextController.actualImageWidth = self.actualImageWidth
            nextController.actualImageHeight = self.actualImageHeight
            
            nextController.h = self.newH
            nextController.w = self.newW
            nextController.border = border
            
            nextController.isFirstTimeImage = true
            nextController.isFirstTimeOlapLeft = true
            nextController.isFirstTimeOlapRight = true
            nextController.isFirstTimeFrame = true
            
            nextController.isFirstTimeImage1 = true
            nextController.isFirstTimeOlapLeft1 = true
            nextController.isFirstTimeOlapRight1 = true
            nextController.isFirstTimeFrame1 = true
        }
        else if let nextController = segue.destination as? TripleMatResultViewController{
            nextController.oLap = self.mapOverLap
            nextController.doubleBottom = self.doubleBottom
            nextController.tripleMiddle = self.tripleMiddle
            nextController.tripleBottom = self.tripleBottom
            nextController.matState = self.matState
            nextController.frameRect = self.frameRect
            nextController.frameHeight = frameHeight
            nextController.frameWidth = frameWidth
            if matState == 0 {
                nextController.iHeight = self.actualImageHeight
                nextController.iWidth = self.actualImageWidth
            }else{
                nextController.iHeight = self.imageHeight
                nextController.iWidth = self.imageWidth
            }
            nextController.imageRect = self.imageRect
            nextController.actualImageWidth = self.actualImageWidth
            nextController.actualImageHeight = self.actualImageHeight
            
            nextController.h = self.newH
            nextController.w = self.newW
            nextController.border = border
            
            nextController.isFirstTimeImage = true
            nextController.isFirstTimeOlapLeft = true
            nextController.isFirstTimeOlapRight = true
            nextController.isFirstTimeFrame = true
            
            nextController.isFirstTimeImage1 = true
            nextController.isFirstTimeOlapLeft1 = true
            nextController.isFirstTimeOlapRight1 = true
            nextController.isFirstTimeFrame1 = true
            
            nextController.isFirstTimeImage2 = true
            nextController.isFirstTimeOlapLeft2 = true
            nextController.isFirstTimeOlapRight2 = true
            nextController.isFirstTimeFrame2 = true
        }
    }
	
}

extension MatSelectionViewController{
	
	func singleMatCalculate(){
		var width = (self.frameWidth - self.actualImageWidth) / 2
		var height = (self.frameHeight - self.actualImageHeight) / 2
		let olap = self.mapOverLap / 2
		
		width += olap
		height += olap
		
		imageHeight = actualImageHeight
		imageWidth = actualImageWidth
		
		self.newH = height
		self.newW = width
	}
	
	func doubleMatCalculate() -> Bool{
		var width = (self.frameWidth - self.actualImageWidth) / 2
		var height = (self.frameHeight - self.actualImageHeight) / 2
		
		if let hval = self.doubleBottomField.text {
			if hval != "" && Double(hval) != nil{
				if ViewController.state.useInches{
					width += (Double(hval)! + doubleBottomDVal) * 72
					height += (Double(hval)! + doubleBottomDVal) * 72
                    
					doubleBottom = (Double(hval)! + doubleBottomDVal) * 72
				}
				else{
					width += (Double(hval)! + doubleBottomDVal) * 28
					height += (Double(hval)! + doubleBottomDVal) * 28

					doubleBottom = (Double(hval)! + doubleBottomDVal) * 28
				}
			}else{
				return false
			}
		}else{
			return false
		}
		
		
		imageHeight = actualImageHeight - doubleBottom
		imageWidth = actualImageWidth - doubleBottom
		newH = height
		newW = width
		return true
	}
	
	func tripleMatCalculate() -> Bool{
		var width = (self.frameWidth - self.actualImageWidth) / 2
		var height = (self.frameHeight - self.actualImageHeight) / 2
		iWidth = self.actualImageWidth
		iHeight = self.actualImageHeight
        
		if let hval = self.tripleMidField.text {
			if hval != "" && Double(hval) != nil{
				if ViewController.state.useInches{
					iWidth += (Double(hval)! + (tripleMiddleDVal)) * 144
					iHeight += (Double(hval)! + (tripleMiddleDVal)) * 144
					
					tripleMiddle = (Double(hval)! + tripleMiddleDVal) * 72
				}
				else{
					iWidth += (Double(hval)! + tripleMiddleDVal) * 28
					iHeight += (Double(hval)! + tripleMiddleDVal) * 28
					
					tripleMiddle = (Double(hval)! + tripleMiddleDVal) * 28
				}
			}
		}
		
		if let hval = self.tripleBottomField.text {
			if hval != "" && Double(hval) != nil{
			if ViewController.state.useInches{
//                iWidth +=  ((Double(hval)! + tripleBottomDVal) * 72)
//                 iHeight +=  ((Double(hval)! + tripleBottomDVal) * 72)
				tripleBottom = (Double(hval)! + tripleBottomDVal) * 72
			}else{
//                iWidth += ((Double(hval)! + tripleBottomDVal) * 28)
//                iHeight += ((Double(hval)! + tripleBottomDVal) * 28)
				
				tripleBottom = (Double(hval)! + tripleBottomDVal) * 28
				}
			}else{
				return false
			}
		}else{
			return false
		}
		
//		if iWidth > frameWidth {
//			iWidth = frameWidth
//		}
//		if iHeight > frameHeight {
//			iHeight = frameHeight
//		}
		imageHeight = iHeight
		imageWidth = iWidth
		newH = (frameHeight - iHeight) / 2
		newW = (frameWidth - iWidth) / 2
		return true
	}
}


extension MatSelectionViewController{
	private func setNavigationItems(){
		self.navigationItem.backBarButtonItem?.title = " "
		
		self.navigationItem.title = "MAT SELECTION"
//		self.navigationItem.backBarButtonItem?.title = "Back"

		self.navigationController?.setNavigationBarHidden(false, animated: false)
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let navFrame = self.navigationController?.navigationBar.frame
            self.navigationController?.navigationBar.frame = CGRect(x: (navFrame?.origin.x)!, y: (navFrame?.origin.y)!, width: navFrame!.width, height: 120)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)]
            
        }
//		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .done, target: self, action: #selector(toAddBorderScreen))
		setBackButton()
		setRightBarButton()
		viewSettings()
	}
	
	private func setBackButton(){
		let backBtn = UIButton(type: .custom)
		backBtn.setImage(#imageLiteral(resourceName: "Back-bar-btn").withRenderingMode(.alwaysOriginal), for: .normal)
		backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        if UI_USER_INTERFACE_IDIOM() == .phone{
            
            let w = backBtn.widthAnchor.constraint(equalToConstant: 50)
            w.isActive = true
            let h = backBtn.heightAnchor.constraint(equalToConstant: 25)
            h.isActive = true
        }
        else{
            
            let w = backBtn.widthAnchor.constraint(equalToConstant: 100)
            w.isActive = true
            let h = backBtn.heightAnchor.constraint(equalToConstant: 50)
            h.isActive = true
        }

		backBtn.frame.offsetBy(dx: -10, dy: 0)
		self.navigationItem.hidesBackButton = true
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)

        
	}
	
	
	private func setRightBarButton(){
		
		let rightbtn = UIButton(type: .roundedRect)
		rightbtn.setImage(#imageLiteral(resourceName: "Result-btn copy").withRenderingMode(.alwaysOriginal), for: .normal)
		rightbtn.addTarget(self, action: #selector(toResults), for: .touchUpInside)
        if UI_USER_INTERFACE_IDIOM() == .phone{
            
            let width = rightbtn.widthAnchor.constraint(equalToConstant: 50)
            width.isActive = true
            let height = rightbtn.heightAnchor.constraint(equalToConstant: 25)
            height.isActive = true
        }
        else{
            
            let width = rightbtn.widthAnchor.constraint(equalToConstant: 100)
            width.isActive = true
            let height = rightbtn.heightAnchor.constraint(equalToConstant: 50)
            height.isActive = true
        }

		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbtn)
		
		//		self.navigationItem.leftBarButtonItem = leftbtn
	}
	
	private func viewSettings(){
		let navColor = UIColor(hexString: "5C5338")
		
		doubleBottomField.layer.borderColor = navColor.cgColor
		doubleBottomField.layer.borderWidth = CGFloat(1)
		doubleBottomField.layer.cornerRadius = CGFloat(4)
		
		doubleBottomMap.layer.borderColor = navColor.cgColor
		doubleBottomMap.layer.borderWidth = CGFloat(1)
		doubleBottomMap.layer.cornerRadius = CGFloat(4)
		
		
		tripleMidField.layer.borderColor = navColor.cgColor
		tripleMidField.layer.borderWidth = CGFloat(1)
		tripleMidField.layer.cornerRadius = CGFloat(4)
		
		tripleMidMap.layer.borderColor = navColor.cgColor
		tripleMidMap.layer.borderWidth = CGFloat(1)
		tripleMidMap.layer.cornerRadius = CGFloat(4)

		tripleBottomField.layer.borderColor = navColor.cgColor
		tripleBottomField.layer.borderWidth = CGFloat(1)
		tripleBottomField.layer.cornerRadius = CGFloat(4)
		
		tripleBottomMap.layer.borderColor = navColor.cgColor
		tripleBottomMap.layer.borderWidth = CGFloat(1)
		tripleBottomMap.layer.cornerRadius = CGFloat(4)
		
	matSelectorBtnGroup.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: UIControlState.selected)

	}
}

