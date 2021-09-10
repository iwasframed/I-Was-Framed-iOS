//
//  ViewController.swift
//  Framed
//
//  Created by Dr. Atta on 30/08/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var useInches:Bool = false
	
	static var state: ControlState = ControlState()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		self.navigationController?.setNavigationBarHidden(true, animated: false)
		self.navigationItem.leftItemsSupplementBackButton = true
		if !(self.navigationItem.leftBarButtonItems?.count == 0) {
			self.navigationItem.leftBarButtonItems = nil
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: false)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print("Use Inches: \(String(describing: ViewController.state.useInches))")
	}
    
    @IBAction func calculateMateBorder(_ sender: Any){
            self.performSegue(withIdentifier: "toFrameSize", sender: nil)
        
        
    }
}


