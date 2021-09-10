//
//  SettingsViewController.swift
//  Framed
//
//  Created by Dr. Atta on 31/08/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

	@IBOutlet weak var inches: UISwitch!
	
	@IBOutlet weak var centimeters: UISwitch!
	var useInches:Bool = false

	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
		self.navigationController?.setNavigationBarHidden(false, animated: false)

            
            useInches = ViewController.state.useInches
        
			
		if(useInches){
			inches.isOn = true
			centimeters.isOn = false
		}
		else{
			inches.isOn = false
			centimeters.isOn = true
		}
		
			print("Use Inches: \(useInches)")
    }
	
	@IBAction func changeInches(_ sender: UISwitch) {
		if sender.isOn {
			centimeters.isOn = false
		}
		else{
			centimeters.isOn = true
		}
		setValue()
	}
	@IBAction func changeCentimeters(_ sender: UISwitch) {
		if sender.isOn {
			inches.isOn = false
		}
		else{
			inches.isOn = true
		}
		setValue()
	}
	
	func setValue(){
		if inches.isOn {
			useInches = true
            UserDefaults.standard.set(true, forKey: "useInches")
		}
		else{
			useInches = false
            UserDefaults.standard.set(false, forKey: "useInches")
		}
		print("Use Inches: \(useInches)")
	ViewController.state.setState(useInches)
        
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: false)
		
		
		self.navigationController?.navigationBar.tintColor = .white
		self.navigationItem.title = "SETTINGS"
        
        if UI_USER_INTERFACE_IDIOM() == .pad{
                let navFrame = self.navigationController?.navigationBar.frame
                self.navigationController?.navigationBar.frame = CGRect(x: (navFrame?.origin.x)!, y: (navFrame?.origin.y)!, width: navFrame!.width, height: 120)
                self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)]
//
//
//            centimeters.transform = CGAffineTransform.init(scaleX: 2.0, y: 1.5)
//            inches.transform = CGAffineTransform.init(scaleX: 2.0, y: 1.5)
        }
	}
	
	
	
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

class ControlState {
	var useInches : Bool!
	
	init(){
        if UserDefaults.standard.bool(forKey: "useInches")
        {
            useInches = true
        }
        else
        {
            useInches = false
        }
		
	}
	
	func setState(_ val:Bool){
		useInches = val
	}
	
}
