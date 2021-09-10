//
//  FrameResultViewController.swift
//  Framed
//
//  Created by Dr. Atta on 04/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import ChainableAnimations


class FrameResultViewController: UIViewController {

	var tempRect : CGRect!
	var tempWidth : Double = 0.0
	var tempHeight : Double = 0.0
	
	var hText : String = ""
	var wText : String = ""
	var border: UIColor!
	
	@IBOutlet weak var drawArea: UIView!
    
    @IBOutlet weak var lblSMTFrameWidth: UILabel!
    @IBOutlet weak var lblSMBFrameWidth: UILabel!
    @IBOutlet weak var lblSMLFrameHeight: UILabel!
    @IBOutlet weak var lblSMRFrameHeight: UILabel!


    
    @IBOutlet weak var frameView: UIView!

    
    var isFirstTimeFrame = true
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setNavigationItems()
		
        // Do any additional setup after loading the view.
    }

//	override func viewWillAppear(_ animated: Bool) {
//		super.viewWillAppear(animated)
//		self.navigationItem.title = "RESULT"
////	self.navigationItem.backBarButtonItem?.title = "DONE"
//		//self.navigationItem.backBarButtonItem?.title = ""
//	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	@objc func goBackOnDone(){	self.navigationController?.popToRootViewController(animated: true)
	}

	@objc func goBack(){
		self.navigationController?.popViewController(animated: true)
	}
	
	func drawShape() {
//		if let layer = self.drawArea.layer.sublayers{
//			for lay in (self.drawArea.layer.sublayers)!{
//				lay.removeFromSuperlayer()
//			}
//		}
//		for view in self.drawArea.subviews{
//			view.removeFromSuperview()
//		}
		
//		let rectView = RectangleDrawingView(drawArea.bounds, self.tempRect, self.border)
//		rectView.backgroundColor = UIColor.clear
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
		yourLabel.textAlignment = NSTextAlignment.center
		
        var v: String!
        
        if ViewController.state.useInches {
        
        if(wText.contains(".")){
            let hArray = wText.characters.split{$0 == "."}.map(String.init)
            let part1 = hArray[0] // First
            let part2 = "0." + hArray[1] // Last
            let res = rationalApproximationOf(x0: Double(part2)!)
            let c = String("\(res.num)/\(res.den)")
            
            if(c == "0/1"){
                v = "\(part1)″";
                lblSMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
                lblSMTFrameWidth.text = v
            }
            else {
                v = part1 + " " + c + " ″";
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: v, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    lblSMTFrameWidth.attributedText = fractionMutableAttributedString(for: v, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
            }
            
            }
            
        }
        else {
            v = wText
            lblSMTFrameWidth.textColor = updateContrastColor(selectedColor: self.border)
            lblSMTFrameWidth.text = v
        }
        
      
        

		//self.drawArea.addSubview(yourLabel)
	}
	
	func addLabels2(_ rect:CGRect){
    
		let orig = rect.origin
		let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
		yourLabel.backgroundColor = UIColor.clear
		yourLabel.textAlignment = NSTextAlignment.center
        
        var v: String!
        
        if ViewController.state.useInches {

        if(hText.contains(".")){
            let hArray = hText.characters.split{$0 == "."}.map(String.init)
            let part1 = hArray[0] // First
            let part2 = "0." + hArray[1] // Last
            let res = rationalApproximationOf(x0: Double(part2)!)
            let c = String("\(res.num)/\(res.den)")
            
            if(c == "0/1"){
                v = "\(part1)″";
                lblSMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
                lblSMLFrameHeight.text = v
            }
            else {
                v = part1 + " " + c + " ″";
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: v, color: updateContrastColor(selectedColor: self.border), size: 15)
                }
                else{
                    lblSMLFrameHeight.attributedText = fractionMutableAttributedString(for: v, color: updateContrastColor(selectedColor: self.border), size: 30)
                }
                
            }
            
            }
            
        }
        else {
            v = hText
            lblSMLFrameHeight.textColor = updateContrastColor(selectedColor: self.border)
            lblSMLFrameHeight.text = v
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
	
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    


}

extension FrameResultViewController{
	private func setNavigationItems(){
		self.navigationItem.title = "RESULT"
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let navFrame = self.navigationController?.navigationBar.frame
            self.navigationController?.navigationBar.frame = CGRect(x: (navFrame?.origin.x)!, y: (navFrame?.origin.y)!, width: navFrame!.width, height: 120)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)]
            
        }
		setLeftBarButton()
		drawShape()
	}
	
	
	private func setLeftBarButton(){
		
		let donebtn = UIButton(type: .roundedRect)
		donebtn.setImage(#imageLiteral(resourceName: "Done-btn").withRenderingMode(.alwaysOriginal), for: .normal)
		donebtn.addTarget(self, action: #selector(goBackOnDone), for: .touchUpInside)
		self.navigationItem.hidesBackButton = true
		if UI_USER_INTERFACE_IDIOM() == .pad{
            let width = donebtn.widthAnchor.constraint(equalToConstant: 100)
            width.isActive = true
            let height = donebtn.heightAnchor.constraint(equalToConstant: 50)
            height.isActive = true
        }
        else{
            let width = donebtn.widthAnchor.constraint(equalToConstant: 50)
            width.isActive = true
            let height = donebtn.heightAnchor.constraint(equalToConstant: 25)
            height.isActive = true
        }
        
         donebtn.contentEdgeInsets.left = 5
        
        
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
			self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backBtn), UIBarButtonItem(customView: donebtn)]
		
		
		
//		self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: donebtn)
		
		//		self.navigationItem.leftBarButtonItem = leftbtn
		
	}
}
