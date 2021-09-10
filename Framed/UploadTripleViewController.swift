//
//  UploadTripleViewController.swift
//  Framed
//
//  Created by Adeel on 04/10/2019.
//  Copyright © 2019 ebmacs. All rights reserved.
//

import UIKit
import Photos
import ChainableAnimations
class UploadTripleViewController: UIViewController {
    
    var colorPicker: ChromaColorPicker!
    @IBOutlet weak var vBorder: UIView!
    @IBOutlet weak var btnUpload: UIButton!
    
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
    
    
    var assetCollection: PHAssetCollection!
    var albumFound : Bool = false
    var photosAsset: PHFetchResult<AnyObject>!
    var assetThumbnailSize:CGSize!
    var collection: PHAssetCollection!
    var assetCollectionPlaceholder: PHObjectPlaceholder!
    
    var layersGroup : [CALayer]!
    var viewsGroup : [UIView]!
    
    
    
    
    
    //Triple Mat Frame
    @IBOutlet weak var lblTMFrameWidth: UILabel!
    @IBOutlet weak var lblTMFrameHeight: UILabel!
    //Triple Mat Image
    @IBOutlet weak var lblTMImageWidth: UILabel!
    @IBOutlet weak var lblTMImageHeight: UILabel!
    //Triple Top Mat Top
    @IBOutlet weak var lblTTMTWidth: UILabel!
    //Triple Top Mat Bottom
    @IBOutlet weak var lblTTMBWidth: UILabel!
    //Triple Top Mat Left
    @IBOutlet weak var lblTTMLHeight: UILabel!
    //Triple Top Mat Right
    @IBOutlet weak var lblTTMRHeight: UILabel!
    
    @IBOutlet weak var lblTMMTWidth: UILabel!
    @IBOutlet weak var lblTMMBWidth: UILabel!
    @IBOutlet weak var lblTMMLHeight: UILabel!
    @IBOutlet weak var lblTMMRHeight: UILabel!
    
    @IBOutlet weak var lblTBMTWidth: UILabel!
    @IBOutlet weak var lblTBMBWidth: UILabel!
    @IBOutlet weak var lblTBMLHeight: UILabel!
    @IBOutlet weak var lblTBMRHeight: UILabel!
    
    
    @IBOutlet weak var TTMView: UIView!
    @IBOutlet weak var TMMView: UIView!
    @IBOutlet weak var TBMView: UIView!
    @IBOutlet weak var TBMImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        
        
        print("Mat State \(matState)")
        
        
        //        for layers in layersGroup{
        //            drawArea.layer.addSublayer(layers)
        //        }
        
        //        for views in viewsGroup{
        //            drawArea.addSubview(views)
        //        }
        
        // Do any additional setup after loading the view.
        
        
        
        draw()
    }
    
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
    //    func drawSingle(){
    //
    //        self.lblSMFrameWidth.text = SMFrameWidth
    //        self.lblSMFrameHeight.text = SMFrameHeight
    //
    //        self.lblSMImageWidth.text = SMImageWidth
    //        self.lblSMImageHeight.text = SMImageHeight
    //
    //        self.lblSMTWidth.text = SMTWidth
    //        self.lblSMBWidth.text = SMBWidth
    //        self.lblSMLHeight.text = SMLHeight
    //        self.lblSMRHeight.text = SMRHeight
    //
    //
    //        self.STMView.backgroundColor = vSTMView.backgroundColor
    //
    //    }
    //    func drawDouble(){
    //
    //        self.lblDMFrameWidth.text = DMFrameWidth
    //        self.lblDMFrameHeight.text = DMFrameHeight
    //
    //        self.lblDMImageWidth.text = DMImageWidth
    //        self.lblDMImageHeight.text = DMImageHeight
    //
    //        self.lblDTMTWidth.text = DTMTWidth
    //        self.lblDTMBWidth.text = DTMBWidth
    //        self.lblDTMLHeight.text = DTMLHeight
    //        self.lblDTMRHeight.text = DTMRHeight
    //
    //        self.lblDBMTWidth.text = DBMTWidth
    //        self.lblDBMBWidth.text = DBMBWidth
    //        self.lblDBMLHeight.text = DBMLHeight
    //        self.lblDBMRHeight.text = DBMRHeight
    //
    //
    //        self.DTMView.backgroundColor = vDTMView.backgroundColor
    //        self.DBMView.backgroundColor = vDBMView.backgroundColor
    //
    //
    //
    //
    //    }
    //    func drawTriple(){
    //
    //        self.lblTMFrameWidth.text = TMFrameWidth
    //        self.lblTMFrameHeight.text = TMFrameHeight
    //
    //        self.lblTMImageWidth.text = TMImageWidth
    //        self.lblTMImageHeight.text = TMImageHeight
    //
    //        self.lblTTMTWidth.text = TTMTWidth
    //        self.lblTTMBWidth.text = TTMBWidth
    //        self.lblTTMLHeight.text = TTMLHeight
    //        self.lblTTMRHeight.text = TTMRHeight
    //
    //        self.lblTMMTWidth.text = TMMTWidth
    //        self.lblTMMBWidth.text = TMMBWidth
    //        self.lblTMMLHeight.text = TMMLHeight
    //        self.lblTMMRHeight.text = TMMRHeight
    //
    //        self.lblTBMTWidth.text = TBMTWidth
    //        self.lblTBMBWidth.text = TBMBWidth
    //        self.lblTBMLHeight.text = TBMLHeight
    //        self.lblTBMRHeight.text = TBMRHeight
    //
    //
    //        self.TTMView.backgroundColor = vTTMView.backgroundColor
    //        self.TMMView.backgroundColor = vTMMView.backgroundColor
    //        self.TBMView.backgroundColor = vTBMView.backgroundColor
    //
    //
    //
    //    }
    
    @IBAction func Upload(){
        print("Uploaded")
        //        let image = UIImage(named: "Image")
        //
        // set up activity view controller
        //        let viewColor = self.view.backgroundColor
        //        let areaColor = drawArea.backgroundColor
        //        drawArea.backgroundColor = UIColor.clear
        //        self.view.backgroundColor = UIColor.clear
        //        let imageToShare = self.takeSnapshotOfView(view: self.drawArea)
        //        self.view.backgroundColor = viewColor
        //        let activityViewController = UIActivityViewController(activityItems: [imageToShare as Any], applicationActivities: nil)
        //        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        //
        //        // exclude some activity types from the list (optional)
        ////        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        //
        //        // present the view controller
        //        self.present(activityViewController, animated: true, completion: nil)
        //        drawArea.backgroundColor = areaColor
        
        self.showAlert()
    }
    
    
    //Show alert
    func showAlert() {
        CameraHandler.shared.showActionSheet(vc: self,react: self.btnUpload.frame)
        CameraHandler.shared.imagePickedBlock = { (image) in
            

                self.TBMImageView.image = self.resizeImage(image: image, newWidth: self.TBMImageView.frame.width, newHeight: self.TBMImageView.frame.height)

            /* get your image here */
            //            if(self.matState == 2){
            //                self.drawImage(image: self.resizeImage(image: image, newWidth: self.frameRect.width, newHeight: self.frameRect.height))
            //
            //            }
            //            else {
            //            self.drawImage(image: self.resizeImage(image: image, newWidth: self.frameRect.width, newHeight: self.frameRect.height))
            //            }
        }
    }
    
    
    func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        //        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    func drawImage(image: UIImage){
        if(self.matState == 2){
            let k = Draw(frame: CGRect(
                origin: CGPoint(x: 0, y: 0),
                size: CGSize(width: frameRect.width, height: frameRect.height)))
            
            k.backgroundColor = UIColor (hexString: "#EBE2C6")
            k.backgroundColor = UIColor(patternImage: image)
            k.center = CGPoint(x: frameRect.midX, y: frameRect.midY);
            
            
            
            self.drawArea.addSubview(k)
        }
        else {
            let k = Draw(frame: CGRect(
                origin: CGPoint(x: 0, y: 0),
                size: CGSize(width: frameRect.width, height: frameRect.height)))
            
            k.backgroundColor = UIColor (hexString: "#EBE2C6")
            k.backgroundColor = UIColor(patternImage: image)
            k.center = CGPoint(x: frameRect.midX, y: frameRect.midY);
            
            
            
            self.drawArea.addSubview(k)
        }
        
        
        
        
        
    }
    
    
    
    @objc func Save(){
        print("Saved")
        //        _ = saveImage(image: takeSnapshotOfView(view: self.drawArea)!)
        //
        let viewColor = self.view.backgroundColor
        
        drawArea.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.clear
        if let displayName = Bundle.main.displayName {
            
            
            try? PHPhotoLibrary.shared().performChangesAndWait {
                PHPhotoLibrary.shared().savePhoto(image: self.takeSnapshotOfView(view: self.drawArea)!, albumName: displayName){ (asset) in
                    let ac = UIAlertController(title: "Saved!", message: "Your image has been saved to I Was Framed.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(ac, animated: true)
                }
                self.view.backgroundColor = viewColor
                
            }
        }
        
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
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    //
    //    func saveImage(image: UIImage) -> String {
    //
    //        let imageData = NSData(data: UIImagePNGRepresentation(image)!)
    //        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,  FileManager.SearchPathDomainMask.userDomainMask, true)
    //        let docs = paths[0] as NSString
    //        let uuid = NSUUID().uuidString + ".png"
    //        let fullPath = docs.appendingPathComponent(uuid)
    //        _ = imageData.write(toFile: fullPath, atomically: true)
    //        return uuid
    //    }
    
    
    
    
    
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


extension UploadTripleViewController{
    private func setNavigationItems(){
        
        self.navigationItem.backBarButtonItem?.title = " "
        
        self.navigationItem.title = "UPLOAD IMAGE"
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
        
        //
        //        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbtn)
        //
        //        self.navigationItem.leftBarButtonItem = leftbtn
        
    }
    
    private func setRightBarButton(){
        
        let rightbtn = UIButton(type: .roundedRect)
        rightbtn.setImage(#imageLiteral(resourceName: "Save-btn").withRenderingMode(.alwaysOriginal), for: .normal)
        
        rightbtn.addTarget(self, action: #selector(Save), for: .touchUpInside)
        
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
        
    }
}
extension UploadTripleViewController{
    
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
                var fract = rationalApproximationOf(x0: round((height-n) * 100)/100)
                
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
                fract = rationalApproximationOf(x0: round((width-n) * 100)/100)
                
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
                var fract = rationalApproximationOf(x0: round((height-n) * 100)/100)
                
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
                fract = rationalApproximationOf(x0: round((width-n) * 100)/100)
                
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
extension UploadTripleViewController{
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
        self.TTMView.backgroundColor = self.colorTop
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
                
                self.lblTMFrameWidth.text = self.SMW
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //                yourLabel.textAlignment = NSTextAlignment.center
                //                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                //yourLabel.text = self.SMW
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                }
                else{
                    self.lblTMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 30)
                }
                
            }
        }
        else{
            //            yourLabel.textColor = UIColor.black
            //            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //            yourLabel.textAlignment = NSTextAlignment.center
            //            yourLabel.text = self.SMW
            
            self.lblTMFrameWidth.text = self.SMW
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
                
                self.lblTMFrameHeight.text = self.SMH
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = UIColor.black
                //                yourLabel.textAlignment = NSTextAlignment.center
                //                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                //yourLabel.text = self.SMH
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                }
                else{
                    self.lblTMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 30)
                }
                
            }
        }
        else{
            //            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
            //            yourLabel.textColor = UIColor.black
            //            yourLabel.textAlignment = NSTextAlignment.center
            //            yourLabel.text = self.SMH
            
            self.lblTMFrameHeight.text = self.SMH
        }
        //lblTMFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        let point = CGSize(width: self.lblTMFrameHeight.frame.height , height: self.lblTMFrameHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblTMFrameHeight)
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
                    
                    self.lblTTMTWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
                    self.lblTTMTWidth.text = SMHeight
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
                    //                    yourLabel.textAlignment = NSTextAlignment.center
                    //                    yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMHeight
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblTTMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 13)
                    }
                    else{
                        self.lblTTMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 26)
                    }
                    
                }
            }
            else{
                //                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
                //                yourLabel.textAlignment = NSTextAlignment.center
                //                yourLabel.text = SMHeight
                
                self.lblTTMTWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
                self.lblTTMTWidth.text = SMHeight
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
                    
                    self.lblTTMBWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
                    self.lblTTMBWidth.text = SMHeight
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
                    //                yourLabel.textAlignment = NSTextAlignment.center
                    //                yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMHeight
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblTTMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 13)
                    }
                    else{
                        self.lblTTMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 26)
                    }
                    
                }
            }
            else{
                //            yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //            yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
                //            yourLabel.textAlignment = NSTextAlignment.center
                //            yourLabel.text = SMHeight
                
                self.lblTTMBWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
                self.lblTTMBWidth.text = SMHeight
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
                    
                    self.lblTTMLHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
                    self.lblTTMLHeight.text = SMWidth
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
                    //                yourLabel.textAlignment = NSTextAlignment.center
                    //                yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMWidth
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblTTMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 13)
                    }
                    else{
                        self.lblTTMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 26)
                    }
                    
                }
            }
            else{
                //            yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //            yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
                //            yourLabel.textAlignment = NSTextAlignment.center
                //            yourLabel.text = SMWidth
                
                self.lblTTMLHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
                self.lblTTMLHeight.text = SMWidth
            }
            lblTTMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
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
                    
                    self.lblTTMRHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
                    self.lblTTMRHeight.text = SMWidth
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
                    //                yourLabel.textAlignment = NSTextAlignment.center
                    //                yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMWidth
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblTTMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 13)
                    }
                    else{
                        self.lblTTMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 26)
                    }
                    
                }
            }
            else{
                //            yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //            yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
                //            yourLabel.textAlignment = NSTextAlignment.center
                //            yourLabel.text = SMWidth
                
                self.lblTTMRHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
                self.lblTTMRHeight.text = SMWidth
            }
            lblTTMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
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
                
                self.lblTMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
                
            }
            else
            {
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72)) \""
                //labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //                labeTop.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                
                self.lblTMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
            }
            
        }
        else {
            if unitState{
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
                self.lblTMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
            }
            else{
                // labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
                self.lblTMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
            }
            //            labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
            //            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        self.lblTMImageWidth.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        
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
                
                self.lblTMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
                //labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //                labelLeft.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                
                self.lblTMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
            }
            
        }
        else {
            if unitState{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
                self.lblTMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
                self.lblTMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
            }
            //            labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
            //            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        
        self.lblTMImageHeight.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        labelLeft.frame.origin = k.bounds.origin;
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        //k.addSubview(labelLeft)
        
        
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
//                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
//                labeTop.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//                labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                
                self.lblTMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
                
            }
            else{
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))\""
                //labeTop.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                labeTop.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblTMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
                self.lblTMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
            }
            else{
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
                self.lblTMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
            }
//            labeTop.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        
        self.lblTMImageWidth.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        labeTop.frame.origin = k.bounds.origin;
        
        labeTop.center = CGPoint(x: k.bounds.midX, y: 10);
        //k.addSubview(labeTop)
        
        
        
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        if ViewController.state.useInches {
            if unitState{
//                labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
//                labelLeft.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                
                self.lblTMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
                //labelLeft.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                labelLeft.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblTMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblTMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
                self.lblTMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
                self.lblTMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
            }
//            labelLeft.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        
        self.lblTMImageHeight.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        labelLeft.frame.origin = k.bounds.origin;
        
        //labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        //k.addSubview(labelLeft)
        
        let point = CGSize(width: self.lblTMImageHeight.frame.height , height: self.lblTMImageHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblTMImageHeight)
        animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
        
    }
    
    
    
    func drawTriple1Image(){
            let k = Draw(frame: CGRect(
                origin: CGPoint(x: 0, y: 0),
                size: CGSize(width: self.frameRect.width - 90, height: self.frameRect.height - 90)))
            
            k.backgroundColor = tripleColor1
            
            k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
            
            
            //self.drawArea.addSubview(k)
            
            self.TBMView.backgroundColor = colorBot
            //TOP
            
            let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labeTop.center = k.center
            labeTop.textAlignment = .center
            
            let rational = rationalApproximationOf(x0: tripleBottom/72)
            
            if ViewController.state.useInches {
                if unitState{
    //                labeTop.text = "\(tripleBottom/72)in"
    //                labeTop.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTBMTWidth.textColor = updateContrastColor(selectedColor: colorBot)
                    self.lblTBMTWidth.text = "\(tripleBottom/72)in"
                }
                else{
                    if(rational.den == 1){
    //                    labeTop.text = String("\(rational.num) ″")
    //                    labeTop.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                    labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTBMTWidth.textColor = updateContrastColor(selectedColor: colorBot)
                        self.lblTBMTWidth.text = String("\(rational.num)″")
                    }
                        
                    else {
                        //labeTop.text = String("\(rational.num)/\(rational.den) \"")
    //                    labeTop.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTBMTWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 13)
                        }
                        else{
                            self.lblTBMTWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 26)
                        }
                        
                    }
                    
                    
                }
                
                
            } else {
                if unitState{
                    let cmText = tripleBottom / 72
                    //labeTop.text = String(format: "%.02f", cmText) + "m"
                    
                    self.lblTBMTWidth.text = String(format: "%.02f", cmText) + "m"
                    
                    
                }
                else{
                    let cmText = tripleBottom / 72
                    //labeTop.text = String(format: "%.02f", cmText) + "cm"
                    
                    self.lblTBMTWidth.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTBMTWidth.textColor = updateContrastColor(selectedColor: colorBot)
                
                
    //            labeTop.textColor = updateContrastColor(selectedColor: tripleColor1)
    //            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            //        labeTop.text = String(format: "%.0f", actualImageWidth / 72)
            
            labeTop.frame.origin = k.bounds.origin;
            
            labeTop.center = CGPoint(x: k.bounds.midX, y: 8);
            //k.addSubview(labeTop)
            
            
            
            //Bottom
            
            let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labelBottom.center = k.center
            labelBottom.textAlignment = .center
            
            
            if ViewController.state.useInches {
                if unitState{
    //                labelBottom.text = "\(tripleBottom/72)in"
    //                labelBottom.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTBMBWidth.textColor = updateContrastColor(selectedColor: colorBot)
                    self.lblTBMBWidth.text = "\(tripleBottom/72)in"
                }
                else{
                    if(rational.den == 1){
    //                    labelBottom.text = String("\(rational.num) ″")
    //                    labelBottom.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                    labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTBMBWidth.textColor = updateContrastColor(selectedColor: colorBot)
                        self.lblTBMBWidth.text = String("\(rational.num)″")
                    }
                        
                    else {
                        //labelBottom.text = String("\(rational.num)/\(rational.den) \"")
    //                    labelBottom.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTBMBWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 13)
                        }
                        else{
                            self.lblTBMBWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 26)
                        }
                        
                    }
                    
                    
                }
                
            }
            else {
                if unitState{
                    let cmText = tripleBottom / 72
                    //labelBottom.text = String(format: "%.02f", cmText) + "m"
                    
                    self.lblTBMBWidth.text = String(format: "%.02f", cmText) + "m"
                }
                else{
                    let cmText = tripleBottom / 72
                    //labelBottom.text = String(format: "%.02f", cmText) + "cm"
                    
                    self.lblTBMBWidth.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTBMBWidth.textColor = updateContrastColor(selectedColor: colorBot)
                
                
                labelBottom.textColor = updateContrastColor(selectedColor: tripleColor1)
                labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            
            
            labelBottom.frame.origin = k.bounds.origin;
            
            labelBottom.center = CGPoint(x: k.bounds.midX, y: k.bounds.maxY - 8);
            //k.addSubview(labelBottom)
            
            
            
            //LEFT
            
            let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labelLeft.textAlignment = .center
            
            let rational1 = rationalApproximationOf(x0: tripleBottom/72)
            
            if ViewController.state.useInches {
                if unitState{
    //                labelLeft.text = "\(tripleBottom/72)in"
    //                labelLeft.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTBMLHeight.textColor = updateContrastColor(selectedColor: colorBot)
                    self.lblTBMLHeight.text = "\(tripleBottom/72)in"
                }
                else{
                    if(rational1.den == 1){
    //                    labelLeft.text = String("\(rational1.num) ″")
    //                    labelLeft.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                    labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTBMLHeight.textColor = updateContrastColor(selectedColor: colorBot)
                        self.lblTBMLHeight.text = String("\(rational1.num)″")
                    }
                        
                    else {
                        //labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
    //                    labelLeft.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTBMLHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 13)
                        }
                        else{
                            self.lblTBMLHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 26)
                        }
                        
                    }
                    
                }
                
            }
            else {
                if unitState{
                    let cmText = tripleBottom / 72
                    //labelLeft.text = String(format: "%.02f", cmText) + "m"
                    
                    self.lblTBMLHeight.text = String(format: "%.02f", cmText) + "m"
                }
                else{
                    let cmText = tripleBottom / 72
                    //labelLeft.text = String(format: "%.02f", cmText) + "cm"
                    
                    self.lblTBMLHeight.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTBMLHeight.textColor = updateContrastColor(selectedColor: colorBot)
                
                
    //            labelLeft.textColor = updateContrastColor(selectedColor: tripleColor1)
    //            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            
            
            labelLeft.frame.origin = k.bounds.origin;
            
            //lblTBMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            labelLeft.center = CGPoint(x: 8, y: k.bounds.midY);
            //k.addSubview(labelLeft)
            
            let point = CGSize(width: self.lblTBMLHeight.frame.height , height: self.lblTBMLHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTBMLHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            
            //Right
            
            let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labelRight.textAlignment = .center
            
            if ViewController.state.useInches {
                if unitState{
    //                labelRight.text = "\(tripleBottom/72)in"
    //                labelRight.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTBMRHeight.textColor = updateContrastColor(selectedColor: colorBot)
                    self.lblTBMRHeight.text = "\(tripleBottom/72)in"
                    
                }
                else{
                    if(rational1.den == 1){
    //                    labelRight.text = String("\(rational1.num) ″")
    //                    labelRight.textColor = updateContrastColor(selectedColor: tripleColor1)
    //                    labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTBMRHeight.textColor = updateContrastColor(selectedColor: colorBot)
                        self.lblTBMRHeight.text = String("\(rational1.num)″")
                    }
                        
                    else {
                        //labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
    //                    labelRight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor1), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTBMRHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 13)
                        }
                        else{
                            self.lblTBMRHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorBot), size: 26)
                        }
                        
                    }
                }
                
                
            }
            else {
                if unitState{
                    let cmText = tripleBottom / 72
                    //labelRight.text = String(format: "%.02f", cmText) + "m"
                    
                    self.lblTBMRHeight.text = String(format: "%.02f", cmText) + "m"
                }
                else{
                    let cmText = tripleBottom / 72
                    //labelRight.text = String(format: "%.02f", cmText) + "cm"
                    
                    self.lblTBMRHeight.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTBMRHeight.textColor = updateContrastColor(selectedColor: colorBot)
                
                
    //            labelRight.textColor = updateContrastColor(selectedColor: tripleColor1)
    //            labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            
            
            labelRight.frame.origin = k.bounds.origin;
            
            //lblTBMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            labelRight.center = CGPoint(x: k.bounds.maxX-8, y: k.bounds.midY);
            //k.addSubview(labelRight)
            
            let point1 = CGSize(width: self.lblTBMRHeight.frame.height , height: self.lblTBMRHeight.frame.width)
            let animatr1 = ChainableAnimator(view: self.lblTBMRHeight)
            animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.11)
            
            
        }
        
        func drawTriple2Image(){
            let k = Draw(frame: CGRect(
                origin: CGPoint(x: 0, y: 0),
                size: CGSize(width: self.frameRect.width - 60, height: self.frameRect.height - 60)))
            
            k.backgroundColor = tripleColor2
            
            k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
            
            
            //self.drawArea.addSubview(k)
            self.TMMView.backgroundColor = colorMid
            
            //Top
            
            let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labeTop.center = k.center
            labeTop.textAlignment = .center
            
            let rational = rationalApproximationOf(x0: tripleMiddle/72)
            if ViewController.state.useInches {
                if unitState{
    //                labeTop.text = "\(tripleMiddle/72)in"
    //                labeTop.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTMMTWidth.textColor = updateContrastColor(selectedColor: colorMid)
                    self.lblTMMTWidth.text = "\(tripleMiddle/72)in"
                    
                    
                }
                else{
                    if(rational.den == 1){
    //                    labeTop.text = String("\(rational.num) ″")
    //                    labeTop.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                    labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTMMTWidth.textColor = updateContrastColor(selectedColor: colorMid)
                        self.lblTMMTWidth.text = String("\(rational.num)″")
                    }
                        
                    else {
                        //labeTop.text = String("\(rational.num)/\(rational.den)\"")
    //                    labeTop.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTMMTWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 13)
                        }
                        else{
                            self.lblTMMTWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 26)
                        }
                        
                    }
                }
                
            }
            else {
                if unitState{
                    let cmText = tripleMiddle / 72
    //                labeTop.text = String(format: "%.02f", cmText) + "m"
                    
                    self.lblTMMTWidth.text = String(format: "%.02f", cmText) + "m"
                }
                else{
                    let cmText = tripleMiddle / 72
    //                labeTop.text = String(format: "%.02f", cmText) + "cm"
                    
                    self.lblTMMTWidth.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTMMTWidth.textColor = updateContrastColor(selectedColor: colorMid)
                
    //            labeTop.textColor = updateContrastColor(selectedColor: tripleColor2)
    //            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            
            
            
            labeTop.frame.origin = k.bounds.origin;
            
            labeTop.center = CGPoint(x: k.bounds.midX, y: 8);
            //k.addSubview(labeTop)
            
            
            //Bottom
            
            
            let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labelBottom.center = k.center
            labelBottom.textAlignment = .center
            
            if ViewController.state.useInches {
                if unitState{
    //                labelBottom.text = "\(tripleMiddle/72)in"
    //                labelBottom.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTMMBWidth.textColor = updateContrastColor(selectedColor: colorMid)
                    self.lblTMMBWidth.text = "\(tripleMiddle/72)in"
                    
                }
                else{
                    if(rational.den == 1){
    //                    labelBottom.text = String("\(rational.num) ″")
    //                    labelBottom.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                    labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTMMBWidth.textColor = updateContrastColor(selectedColor: colorMid)
                        self.lblTMMBWidth.text = String("\(rational.num)″")
                    }
                        
                    else {
                        //labelBottom.text = String("\(rational.num)/\(rational.den)\"")
    //                    labelBottom.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTMMBWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 13)
                        }
                        else{
                            self.lblTMMBWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 26)
                        }
                        
                    }
                }
                
            }
            else {
                if unitState{
                    let cmText = tripleMiddle / 72
    //                labelBottom.text = String(format: "%.02f", cmText) + "m"
                    
                    self.lblTMMBWidth.text = String(format: "%.02f", cmText) + "m"
                }
                else{
                    let cmText = tripleMiddle / 72
    //                labelBottom.text = String(format: "%.02f", cmText) + "cm"
                    
                    self.lblTMMBWidth.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTMMBWidth.textColor = updateContrastColor(selectedColor: colorMid)
                
    //            labelBottom.textColor = updateContrastColor(selectedColor: tripleColor2)
    //            labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            
            
            
            labelBottom.frame.origin = k.bounds.origin;
            
            labelBottom.center = CGPoint(x: k.bounds.midX, y: k.bounds.maxY - 6);
            //k.addSubview(labelBottom)
            
            //LEFT
            
            let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labelLeft.textAlignment = .center
            
            let rational1 = rationalApproximationOf(x0: tripleMiddle/72)
            
            if ViewController.state.useInches {
                if unitState{
    //                labelLeft.text = "\(tripleMiddle/72)in"
    //                labelLeft.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTMMLHeight.textColor = updateContrastColor(selectedColor: colorMid)
                    self.lblTMMLHeight.text = "\(tripleMiddle/72)in"
                    
                }
                else{
                    if(rational1.den == 1){
    //                    labelLeft.text = String("\(rational1.num) ″")
    //                    labelLeft.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                    labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTMMLHeight.textColor = updateContrastColor(selectedColor: colorMid)
                        self.lblTMMLHeight.text = String("\(rational1.num)″")
                    }
                        
                    else {
                        //labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
    //                    labelLeft.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTMMLHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 13)
                        }
                        else{
                            self.lblTMMLHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 26)
                        }
                        
                    }
                }
                
                
            }
            else {
                if unitState{
                    let cmText = tripleMiddle / 72
                    //labelLeft.text = String(format: "%.02f", cmText) + "m"
                    
                    self.lblTMMLHeight.text = String(format: "%.02f", cmText) + "m"
                }
                else{
                    let cmText = tripleMiddle / 72
                    //labelLeft.text = String(format: "%.02f", cmText) + "cm"
                    
                    self.lblTMMLHeight.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTMMLHeight.textColor = updateContrastColor(selectedColor: colorMid)
                
                
    //            labelLeft.textColor = updateContrastColor(selectedColor: tripleColor2)
    //            labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            
            
            labelLeft.frame.origin = k.bounds.origin;
            
            //lblTMMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            labelLeft.center = CGPoint(x: 8, y: k.bounds.midY);
            //k.addSubview(labelLeft)
            
            let point = CGSize(width: self.lblTMMLHeight.frame.height , height: self.lblTMMLHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblTMMLHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            
            
            //RIGHT
            
            
            let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labelRight.textAlignment = .center
            
            if ViewController.state.useInches {
                if unitState{
    //                labelRight.text = "\(tripleMiddle/72)in"
    //                labelRight.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                    
                    self.lblTMMRHeight.textColor = updateContrastColor(selectedColor: colorMid)
                    self.lblTMMRHeight.text = "\(tripleMiddle/72)in"
                }
                else{
                    if(rational1.den == 1){
    //                    labelRight.text = String("\(rational1.num) ″")
    //                    labelRight.textColor = updateContrastColor(selectedColor: tripleColor2)
    //                    labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
                        
                        self.lblTMMRHeight.textColor = updateContrastColor(selectedColor: colorMid)
                        self.lblTMMRHeight.text = String("\(rational1.num)″")
                        
                    }
                        
                    else {
                        //labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
    //                    labelRight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: tripleColor2), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTMMRHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 13)
                        }
                        else{
                            self.lblTMMRHeight.attributedText = fractionMutableAttributedString(for: String("\(rational1.num)/\(rational1.den) ″"), color: updateContrastColor(selectedColor: colorMid), size: 26)
                        }
                        
                    }
                }
                
                
            }
            else {
                if unitState{
                    let cmText = tripleMiddle / 72
                    //labelRight.text = String(format: "%.02f", cmText) + "m"
                    
                    
                    self.lblTMMRHeight.text = String(format: "%.02f", cmText) + "m"
                }
                else{
                    let cmText = tripleMiddle / 72
                    //labelRight.text = String(format: "%.02f", cmText) + "cm"
                    
                    
                    self.lblTMMRHeight.text = String(format: "%.02f", cmText) + "cm"
                }
                
                self.lblTMMRHeight.textColor = updateContrastColor(selectedColor: colorMid)
                
    //            labelRight.textColor = updateContrastColor(selectedColor: tripleColor2)
    //            labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
            }
            
            
            labelRight.frame.origin = k.bounds.origin;
            
            //lblTMMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            labelRight.center = CGPoint(x: k.bounds.maxX-6, y: k.bounds.midY);
            //k.addSubview(labelRight)
            
            let point1 = CGSize(width: self.lblTMMRHeight.frame.height , height: self.lblTMMRHeight.frame.width)
            let animatr1 = ChainableAnimator(view: self.lblTMMRHeight)
            animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.11)
            
            
        }
    
    
    func drawDouble(){
//        //        if imageRect.height > frameRect.height
//        //        {
//        //            imageRect.size.height = frameRect.height - 40
//        //            if imageRect.height < 0{
//        //                imageRect.size.height = 0
//        //            }
//        //        }
//        ////        else{
//        ////            imageRect.size.height = frameRect.height - 80
//        ////        }
//        //
//        //
//        //        if imageRect.width > frameRect.width
//        //        {
//        //            imageRect.size.width = frameRect.width - 40
//        //            if imageRect.width < 0{
//        //                imageRect.size.width = 0
//        //            }
//        //        }
//        ////        else
//        ////        {
//        ////            imageRect.size.width = frameRect.width - 80
//        ////        }
//        //
//        //        imageRect.origin = CGPoint(x: frameRect.midX - (imageRect.width / 2), y:  frameRect.midY - (imageRect.height / 2))
//        //
//        //        //        self.frameRect = rect
//        //
//        //
//        //        doubleLayer.path = UIBezierPath.init(rect: self.imageRect).cgPath
//        //        doubleLayer.fillColor = UIColor.clear.cgColor
//        //        doubleLayer.lineWidth = 40
//        //        doubleLayer.strokeColor = colorMid.cgColor
//
//        //drawArea.layer.addSublayer(doubleLayer)
//
//
//        //TOP
//        self.DBMView.backgroundColor = self.colorMid
//        let orig = frameRect.origin
//        var yourLabel : UILabel!
//
//
//        if(matState == 1){
//
//            yourLabel = UILabel(frame: CGRect(x: frameRect.minX + 25 , y: orig.y + 25 , width: self.view.frame.width/2, height: 30))
//            if ViewController.state.useInches{
//
//                if unitState{
//                    //                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    //                    yourLabel.text = "\(self.DMW)"
//
//                    self.lblDBMTWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    self.lblDBMTWidth.text = "\(self.DMW)"
//                }
//                else{
//                    let rational = rationalApproximationOf(x0: doubleBottom/72)
//                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
//                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
//                    //                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//
//                    self.lblDBMTWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//                }
//            }
//            else{
//
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                //                //yourLabel.text = "\(self.DMW)"
//                //                yourLabel.text = "\(self.DMW)"
//
//                self.lblDBMTWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
//                self.lblDBMTWidth.text = "\(self.DMW)"
//            }
//        }
//        //        else {
//        //            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y + 17, width: self.view.frame.width/2, height: 30))
//        //            yourLabel.text = "\(self.DMW)\""
//        //        }
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textAlignment = NSTextAlignment.center
//        //self.drawArea.addSubview(yourLabel)
//
//
//        //Bottom
//
//
//        if(matState == 1){
//            yourLabel = UILabel(frame: CGRect(x: frameRect.minX + 25 , y: frameRect.maxY - 55 , width: self.view.frame.width/2, height: 30))
//
//            if ViewController.state.useInches{
//                if unitState{
//                    //                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    //                    yourLabel.text = "\(self.DMW)"
//
//                    self.lblDBMBWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    self.lblDBMBWidth.text = "\(self.DMW)"
//                }
//                else{
//                    let rational = rationalApproximationOf(x0: doubleBottom/72)
//                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
//                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                    //                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//
//                    self.lblDBMBWidth.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//                }
//            }
//            else{
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                //                yourLabel.text = "\(self.DMW)"
//
//                self.lblDBMBWidth.textColor = updateContrastColor(selectedColor: self.colorBot)
//                self.lblDBMBWidth.text = "\(self.DMW)"
//            }
//        }
//        //        else {
//        //            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: imageRect.height - 10, width: self.view.frame.width/2, height: 30))
//        //            yourLabel.text = "\(self.DMH)\""
//        //        }
//
//
//        yourLabel.textAlignment = NSTextAlignment.center
//        //self.drawArea.addSubview(yourLabel)
//
//        // LEft
//
//        if(matState == 1){
//            yourLabel = UILabel(frame: CGRect(x: frameRect.minX - 55, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
//
//            if ViewController.state.useInches{
//                if unitState{
//                    //                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    //                    yourLabel.text = "\(self.DMH)"
//
//                    self.lblDBMLHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    self.lblDBMLHeight.text = "\(self.DMH)"
//                }
//                else{
//                    let rational = rationalApproximationOf(x0: doubleBottom/72)
//
//                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
//                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                    //                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//
//                    self.lblDBMLHeight.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//                }
//            }
//            else{
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                //                yourLabel.text = "\(self.DMH)"
//
//                self.lblDBMLHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
//                self.lblDBMLHeight.text = "\(self.DMH)"
//            }
//        }
//        //        else {
//        //            yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 28, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        //            yourLabel.text = "\(self.DMH)\""
//        //        }
//        //yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
//        //
//        //        yourLabel.backgroundColor = UIColor.clear
//        //
//        //        yourLabel.textAlignment = NSTextAlignment.center
//        lblDBMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        //self.drawArea.addSubview(yourLabel)
//
//
//
//        //Right
//
//        if(matState == 1){
//            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - 10 , y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
//
//            if ViewController.state.useInches{
//                if unitState{
//                    //                    yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    //                    yourLabel.text = "\(self.DMH)"
//
//                    self.lblDBMRHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    self.lblDBMRHeight.text = "\(self.DMH)"
//                }
//                else{
//                    let rational = rationalApproximationOf(x0: doubleBottom/72)
//
//                    //yourLabel.text = String("\(rational.num)/\(rational.den)\"")
//                    //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                    //                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    //                    yourLabel.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//
//                    self.lblDBMRHeight.attributedText = fractionMutableAttributedString(for: String("\(rational.num)/\(rational.den) ″"), color: updateContrastColor(selectedColor: self.colorBot), size: 11)
//                }
//            }
//            else{
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                //                yourLabel.text = "\(self.DMH)"
//
//                self.lblDBMRHeight.textColor = updateContrastColor(selectedColor: self.colorBot)
//                self.lblDBMRHeight.text = "\(self.DMH)"
//            }
//        }
//        //        else {
//        //            yourLabel = UILabel(frame: CGRect(x: imageRect.maxX - self.view.frame.width/4 - 30, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        //            yourLabel.text = "\(self.DMH)\""
//        //        }
//
//
//        //        yourLabel.textAlignment = NSTextAlignment.center
//        lblDBMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        //self.drawArea.addSubview(yourLabel)
//
//
//
//
//
//
//
//        //Top
//        //        if(matState == 1){
//        //yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/6, y: orig.y - 5 , width: self.view.frame.width/2, height: 30))
//        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: imageRect.origin.y - 5, width: self.view.frame.width/2, height: 12))
//        //        }
//        //        else{
//        //            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y , width: self.view.frame.width/2, height: 12))
//        //        }
//
//        yourLabel.backgroundColor = UIColor.clear
//        if ViewController.state.useInches{
//            if unitState{
//                //                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.text = DMHeight
//
//                self.lblDBMTWidth.textColor = updateContrastColor(selectedColor: colorMid)
//                self.lblDBMTWidth.text = DMHeight
//            }
//            else{
//                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorMid), size: 11)
//                //yourLabel.text = DMHeight
//
//                self.lblDBMTWidth.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorMid), size: 11)
//            }
//        }
//        else{
//            //            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            //            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            //            yourLabel.textAlignment = NSTextAlignment.center
//            //            yourLabel.text = DMHeight
//
//            self.lblDBMTWidth.textColor = updateContrastColor(selectedColor: colorMid)
//            self.lblDBMTWidth.text = DMHeight
//        }
//        //self.drawArea.addSubview(yourLabel)
//
//        //Bottom
//        //        if(matState == 1){
//        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: imageRect.maxY - 5 , width: self.view.frame.width/2, height: 12))
//        //        }
//        //        else{
//        //            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y  , width: self.view.frame.width/2, height: 12))
//        //        }
//        yourLabel.backgroundColor = UIColor.clear
//        if ViewController.state.useInches{
//            if unitState{
//                //                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.text = DMHeight
//
//                self.lblDBMBWidth.textColor = updateContrastColor(selectedColor: colorMid)
//                self.lblDBMBWidth.text = DMHeight
//            }
//            else{
//                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorMid), size: 11)
//                //yourLabel.text = DMHeight
//
//                self.lblDBMBWidth.attributedText = fractionMutableAttributedString(for: DMHeight, color: updateContrastColor(selectedColor: colorMid), size: 11)
//            }
//        }
//        else{
//            //            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            //            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            //            yourLabel.textAlignment = NSTextAlignment.center
//            //            yourLabel.text = DMHeight
//
//            self.lblDBMBWidth.textColor = updateContrastColor(selectedColor: colorMid)
//            self.lblDBMBWidth.text = DMHeight
//        }
//        //self.drawArea.addSubview(yourLabel)
//
//        //Left
//        //       if(matState == 1){
//        yourLabel = UILabel(frame: CGRect(x: (imageRect.origin.x - self.view.frame.width/4), y: imageRect.midY, width: self.view.frame.width/2, height: 12))
//        //        }
//        //        else{
//        //            yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 12))
//        //        }
//
//        yourLabel.backgroundColor = UIColor.clear
//        if ViewController.state.useInches{
//            if unitState{
//                //                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.text = DMWidth
//
//                self.lblDBMLHeight.textColor = updateContrastColor(selectedColor: colorMid)
//                self.lblDBMLHeight.text = DMWidth
//            }
//            else{
//                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorMid), size: 11)
//                //yourLabel.text = DMWidth
//
//                self.lblDBMLHeight.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorMid), size: 11)
//            }
//        }
//        else{
//            //            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            //            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            //            yourLabel.textAlignment = NSTextAlignment.center
//            //            yourLabel.text = DMWidth
//
//            self.lblDBMLHeight.textColor = updateContrastColor(selectedColor: colorMid)
//            self.lblDBMLHeight.text = DMWidth
//        }
//        lblDBMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        //self.drawArea.addSubview(yourLabel)
//
//        //Right
//        if(matState == 1){
//            //yourLabel = UILabel(frame: CGRect(x: imageRect.midX - 15, y: imageRect.midY, width: self.view.frame.width/2, height: 12))
//            yourLabel = UILabel(frame: CGRect(x: imageRect.maxX - self.view.frame.width/4, y: imageRect.midY, width: self.view.frame.width/2, height: 12))
//        }
//        else{
//            yourLabel = UILabel(frame: CGRect(x: imageRect.midX - 15, y: imageRect.midY, width: self.view.frame.width/2, height: 12))
//        }
//        yourLabel.backgroundColor = UIColor.clear
//        if ViewController.state.useInches{
//            if unitState{
//                //                yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //                yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.text = DMWidth
//
//                self.lblDBMRHeight.textColor = updateContrastColor(selectedColor: colorMid)
//                self.lblDBMRHeight.text = DMWidth
//            }
//            else{
//                //yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(10))
//                //                yourLabel.textAlignment = NSTextAlignment.center
//                //                yourLabel.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorMid), size: 11)
//                //yourLabel.text = DMWidth
//
//                self.lblDBMRHeight.attributedText = fractionMutableAttributedString(for: DMWidth, color: updateContrastColor(selectedColor: colorMid), size: 11)
//            }
//        }
//        else{
//            //            yourLabel.textColor = updateContrastColor(selectedColor: colorMid)
//            //            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//            //            yourLabel.textAlignment = NSTextAlignment.center
//            //            yourLabel.text = DMWidth
//
//            self.lblDBMRHeight.textColor = updateContrastColor(selectedColor: colorMid)
//            self.lblDBMRHeight.text = DMWidth
//        }
//
//        lblDBMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        //self.drawArea.addSubview(yourLabel)
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
        
        //        self.frameRect = rect
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: rect).cgPath
        layer.fillColor = colorTop.cgColor
        layer.lineWidth = 20
        layer.strokeColor = colorTop.cgColor
        
        self.TTMView.backgroundColor = colorTop
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
//        yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! + 10 , width: self.view.frame.width/2, height: 12))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            if unitState{
                let numArr = TMHeight.components(separatedBy: ".")
                
                var firstNum: String = numArr[0]
                var secondNum: String = numArr[1]
                
                if(secondNum == "0in"){
                    //yourLabel.text = "\(firstNum)in"
                    
                    self.lblTTMTWidth.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMTWidth.text = "\(firstNum)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum) \(String("\(rational.num)/\(rational.den)") )\""
                    //yourLabel.text = TMHeight
                    
                    self.lblTTMTWidth.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMTWidth.text = TMHeight
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
                        //yourLabel.text = "\(firstNum) ″"
                        
                        self.lblTTMTWidth.textColor = updateContrastColor(selectedColor: colorTop)
                        self.lblTTMTWidth.text = "\(firstNum) ″"
                    }
                    else {
//                        yourLabel.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTTMTWidth.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 13)
                        }
                        else{
                            self.lblTTMTWidth.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 26)
                        }
                        
                    }
                }
                else{
                    //firstNum = numArr[0]
                    //yourLabel.text = "\(firstNum)\""
                    //yourLabel.text = TMHeight
                    
                    self.lblTTMTWidth.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMTWidth.text = TMHeight
                }
                
            }
            
        }
        else {
            //yourLabel.text = TMHeight
            
            self.lblTTMTWidth.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblTTMTWidth.text = TMHeight
        }
        //self.drawArea.addSubview(yourLabel)
        
        //Bottom
//        yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)!  + rect.height - 20, width: self.view.frame.width/2, height: 12))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            if unitState{
                let numArr1 = TMHeight.components(separatedBy: ".")
                
                var firstNum1: String = numArr1[0]
                var secondNum1: String = numArr1[1]
                
                if(secondNum1 == "0in"){
                    //yourLabel.text = "\(firstNum1)in"
                    
                    self.lblTTMBWidth.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMBWidth.text = "\(firstNum1)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum1.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum1) \(String("\(rational.num)/\(rational.den)") )in"
                    //yourLabel.text = TMHeight
                    
                    self.lblTTMBWidth.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMBWidth.text = TMHeight
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
                        //yourLabel.text = "\(firstNum1) ″"
                        
                        self.lblTTMBWidth.textColor = updateContrastColor(selectedColor: colorTop)
                        self.lblTTMBWidth.text = "\(firstNum1) ″"
                    }
                    else{
//                        yourLabel.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTTMBWidth.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 13)
                        }
                        else{
                            self.lblTTMBWidth.attributedText = fractionMutableAttributedString(for: TMHeight, color: updateContrastColor(selectedColor: colorTop), size: 26)
                        }
                        
                    }
                }
                else{
                    //firstNum1 = numArr1[0]
                    //yourLabel.text = "\(firstNum1)\""
                    //yourLabel.text = TMHeight
                    
                    self.lblTTMBWidth.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMBWidth.text = TMHeight
                }
                
            }
            
            
        }
        else {
            self.lblTTMBWidth.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblTTMBWidth.text = TMHeight
        }
        
        //self.drawArea.addSubview(yourLabel)
        
        //Left
//        yourLabel = UILabel(frame: CGRect(x: ((orig?.x)! - self.view.frame.width/4) + 15, y: rect.midY , width: self.view.frame.width/2, height: 12))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            if unitState{
                let numArr2 = TMWidth.components(separatedBy: ".")
                
                var firstNum2: String = numArr2[0]
                var secondNum2: String = numArr2[1]
                
                if(secondNum2 == "0in"){
                    //yourLabel.text = "\(firstNum2)in"
                    
                    self.lblTTMLHeight.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMLHeight.text = "\(firstNum2)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum2.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum2) \(String("\(rational.num)/\(rational.den)") )in"
                    //yourLabel.text = TMWidth
                    
                    self.lblTTMLHeight.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMLHeight.text = TMWidth
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
                        //yourLabel.text = "\(firstNum2) ″"
                        
                        self.lblTTMLHeight.textColor = updateContrastColor(selectedColor: colorTop)
                        self.lblTTMLHeight.text = "\(firstNum2) ″"
                    }
                        
                    else{
//                        yourLabel.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTTMLHeight.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 13)
                        }
                        else{
                            self.lblTTMLHeight.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 26)
                        }
                        
                    }
                }
                else{
                    //firstNum2 = numArr2[0]
                    //yourLabel.text = "\(firstNum2)\""
                    //yourLabel.text = TMWidth
                    
                    self.lblTTMLHeight.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMLHeight.text = TMWidth
                }
                
            }
            
            
        }
        else {
            //yourLabel.text = TMWidth
            
            self.lblTTMLHeight.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblTTMLHeight.text = TMWidth
        }
        //lblTTMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        let point = CGSize(width: self.lblTTMLHeight.frame.height , height: self.lblTTMLHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblTTMLHeight)
        animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
        
        //Right
//        yourLabel = UILabel(frame: CGRect(x: (rect.maxX - self.view.frame.width/4) - 15, y: rect.midY , width: self.view.frame.width/2, height: 12))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = updateContrastColor(selectedColor: colorTop)
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(11))
//        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            if unitState{
                let numArr3 = TMWidth.components(separatedBy: ".")
                
                var firstNum3: String = numArr3[0]
                var secondNum3: String = numArr3[1]
                
                if(secondNum3 == "0in"){
                    //yourLabel.text = "\(firstNum3)in"
                    
                    self.lblTTMRHeight.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMRHeight.text = "\(firstNum3)in"
                }
                else {
                    //var rational = rationalApproximationOf(x0: Double("0.\(secondNum3.replacingOccurrences(of: "in", with: ""))")!)
                    
                    //yourLabel.text = " \(firstNum3) \(String("\(rational.num)/\(rational.den)") )in"
                    //yourLabel.text = TMWidth
                    
                    self.lblTTMRHeight.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMRHeight.text = TMWidth
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
                        //yourLabel.text = "\(firstNum3) ″"
                        
                        self.lblTTMRHeight.textColor = updateContrastColor(selectedColor: colorTop)
                        self.lblTTMRHeight.text = "\(firstNum3) ″"
                    }
                        
                    else{
//                        yourLabel.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 11)
                        if UI_USER_INTERFACE_IDIOM() == .phone{
                            self.lblTTMRHeight.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 13)
                        }
                        else{
                            self.lblTTMRHeight.attributedText = fractionMutableAttributedString(for: TMWidth, color: updateContrastColor(selectedColor: colorTop), size: 26)
                        }
                        
                    }
                }
                else{
                    //firstNum3 = numArr3[0]
                    //yourLabel.text = "\(firstNum3)\""
                    //yourLabel.text = TMWidth
                    
                    self.lblTTMRHeight.textColor = updateContrastColor(selectedColor: colorTop)
                    self.lblTTMRHeight.text = TMWidth
                }
                
            }
            
            
        }
        else {
            //yourLabel.text = TMWidth
            
            self.lblTTMRHeight.textColor = updateContrastColor(selectedColor: colorTop)
            self.lblTTMRHeight.text = TMWidth
        }
        
        //lblTTMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        let point1 = CGSize(width: self.lblTTMRHeight.frame.height , height: self.lblTTMRHeight.frame.width)
        let animatr1 = ChainableAnimator(view: self.lblTTMRHeight)
        animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.11)
    }
    
    
    func drawShape() {
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 20
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
        yourLabel.textColor = updateContrastColor(selectedColor: .black)
        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.wText
        //self.drawArea.addSubview(yourLabel)
    }
    
    func addLabels2(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        yourLabel.textColor = updateContrastColor(selectedColor: .black)
        yourLabel.textAlignment = NSTextAlignment.center
        
        //        yourLabel.text = self.hText
        
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
    }
    
}


