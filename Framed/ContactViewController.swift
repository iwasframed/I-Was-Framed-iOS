//
//  ContactViewController.swift
//  Framed
//
//  Created by Dr. Atta on 30/08/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate, MFMailComposeViewControllerDelegate {

	@IBOutlet weak var firstName: UITextField!
	@IBOutlet weak var lastName: UITextField!
	@IBOutlet weak var emailAddress: UITextField!
	@IBOutlet weak var phone: UITextField!
	@IBOutlet weak var message: UITextView!
	
	var fname = ""
	var lname = ""
	var email = ""
	var phoneNum = ""
	var msg = ""
	
	var checkFilledFields = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
		self.navigationController?.setNavigationBarHidden(false, animated: false)
		
		self.firstName.delegate = self
		self.lastName.delegate = self
		self.emailAddress.delegate = self
		self.phone.delegate = self
		self.message.delegate = self
    }
	
	
	@IBAction func submitMail(_ sender: UIButton) {
		composingMail()
		let finalMessage = "Name: \(fname) \(lname) \n" + "Phone: \(phoneNum) \n" + "Email: \(email) \n" + "Message \(msg) \n"
		if !checkFilledFields {
			let alert = UIAlertController.init(title: "All fields required?", message: "Please fill all fields!", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
			self.present(alert, animated: true, completion: nil)
			return
		}
		else{
			if !MFMailComposeViewController.canSendMail() {
				print("Mail services are not available")
				let alert = UIAlertController.init(title: "Can't Send Mail", message: "Please disable the email dispatch features in your application!", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
				self.present(alert, animated: true, completion: nil)
				return
			}
			else{
				let composeVC = MFMailComposeViewController()
				composeVC.mailComposeDelegate = self
				
				// Configure the fields of the interface.
				composeVC.setToRecipients(["app@iwasframed.com"])
				composeVC.setSubject("Customer @ I Was Framed")
				composeVC.setMessageBody(finalMessage, isHTML: false)
				
				// Present the view controller modally.
				self.present(composeVC, animated: true, completion: nil)
			}
		}
		
	}
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
	func composingMail(){
		if firstName.text != nil{
			if (firstName.text != "") {
				checkFilledFields = true
				fname = firstName.text!
			}
			else{
				checkFilledFields = false
			}
		}
		if lastName.text != nil{
			if (lastName.text != "") {
				checkFilledFields = true
				lname = lastName.text!
			}
			else{
				checkFilledFields = false
			}
		}
		if emailAddress.text != nil{
			if (emailAddress.text != "") {
				checkFilledFields = true
				email = emailAddress.text!
			}
			else{
				checkFilledFields = false
			}
		}
		if phone.text != nil{
			if (phone.text != "") {
				checkFilledFields = true
				phoneNum = phone.text!
			}
			else{
				checkFilledFields = false
			}
		}
		if message.text != nil{
			if (message.text != "") {
				checkFilledFields = true
				msg = message.text!
			}
			else{
				checkFilledFields = false
			}
		}
	}
	
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: false)
		
		
		self.navigationController?.navigationBar.tintColor = .white
		self.navigationItem.title = "CONTACT US"
        if UI_USER_INTERFACE_IDIOM() == .pad{
            let navFrame = self.navigationController?.navigationBar.frame
            self.navigationController?.navigationBar.frame = CGRect(x: (navFrame?.origin.x)!, y: (navFrame?.origin.y)!, width: navFrame!.width, height: 120)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)]
            
        }
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
	
    }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == firstName {
			textField.resignFirstResponder()
			lastName.becomeFirstResponder()
		}
		else if textField == lastName {
			textField.resignFirstResponder()
			emailAddress.becomeFirstResponder()
		}
		else if textField == emailAddress {
			textField.resignFirstResponder()
			phone.becomeFirstResponder()
		}
		else if textField == phone {
			textField.resignFirstResponder()
			message.becomeFirstResponder()
		}
		else {
			if textField == message
			{
				textField.endEditing(true)
			}
		}
		return true
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
