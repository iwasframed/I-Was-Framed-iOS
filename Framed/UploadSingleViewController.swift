//
//  UploadViewController.swift
//  Framed
//
//  Created by Dr. Atta on 02/09/2018.
//  Copyright © 2018 ebmacs. All rights reserved.
//

import UIKit
import Photos
import ChainableAnimations
class UploadSingleViewController: UIViewController {
    
    var colorPicker: ChromaColorPicker!
    @IBOutlet weak var colorDisplayView: UIView!
    @IBOutlet weak var btnUpload: UIButton!
    
    @IBOutlet weak var vBorder: UIView!
    
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
    var colorBot: UIColor = UIColor.white
    
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
    
    
    
    
    
    
    @IBOutlet weak var lblSMFrameWidth: UILabel!
    @IBOutlet weak var lblSMFrameHeight: UILabel!
    
    @IBOutlet weak var lblSMImageWidth: UILabel!
    @IBOutlet weak var lblSMImageHeight: UILabel!
    
    @IBOutlet weak var lblSMTWidth: UILabel!
    @IBOutlet weak var lblSMBWidth: UILabel!
    @IBOutlet weak var lblSMLHeight: UILabel!
    @IBOutlet weak var lblSMRHeight: UILabel!
    
    
    @IBOutlet weak var STMView: UIView!
    @IBOutlet weak var SBMImageView: UIImageView!
    
    
    
    
    
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
            

        self.SBMImageView.image = self.resizeImage(image: image, newWidth: self.SBMImageView.frame.width, newHeight: self.SBMImageView.frame.height)

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


extension UploadSingleViewController{
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
extension UploadSingleViewController{
    
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
extension UploadSingleViewController{
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
//        //        self.frameRect = rect
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
//        //        if !ViewController.state.useInches {
//        //            imageRect.size.width = imageRect.size.width + 50
//        //        }
//
//        imageRect.origin = CGPoint(x: frameRect.midX - (imageRect.width / 2), y:  frameRect.midY - (imageRect.height / 2))
//
//
//
//        singleLayer.path = UIBezierPath.init(rect: frameRect).cgPath
//        singleLayer.fillColor = self.colorBot.cgColor
        
        
        //drawArea.layer.addSublayer(singleLayer)
        self.STMView.backgroundColor = self.colorTop
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
                
                self.lblSMFrameWidth.text = self.SMW
            }
            else{
                //yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                //yourLabel.text = self.SMW
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 15)
                }
                else{
                    self.lblSMFrameWidth.attributedText = fractionMutableAttributedString(for: self.SMW, color: .black, size: 30)
                }
                
            }
        }
        else{
//            yourLabel.textColor = UIColor.black
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.SMW
            
            self.lblSMFrameWidth.text = self.SMW
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
                
                self.lblSMFrameHeight.text = self.SMH
            }
            else{
                //yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //yourLabel.textColor = UIColor.black
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                //yourLabel.text = self.SMH
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 15)
                }
                else{
                    self.lblSMFrameHeight.attributedText = fractionMutableAttributedString(for: self.SMH, color: .black, size: 30)
                }
                
            }
        }
        else{
//            yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//            yourLabel.textColor = UIColor.black
//            yourLabel.textAlignment = NSTextAlignment.center
//            yourLabel.text = self.SMH
            
            self.lblSMFrameHeight.text = self.SMH
        }
        //lblSMFrameHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
        
        let point = CGSize(width: self.lblSMFrameHeight.frame.height , height: self.lblSMFrameHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblSMFrameHeight)
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
                    
                    self.lblSMTWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMTWidth.text = SMHeight
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMHeight
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMTWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMHeight
                
                self.lblSMTWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMTWidth.text = SMHeight
            }
            //self.drawArea.addSubview(yourLabel)
            
            
            
            //Bottom
            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 40 + frameRect.height, width: self.view.frame.width/2, height: 30))
            yourLabel.backgroundColor = UIColor.clear
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.text = SMHeight
                    
                    self.lblSMBWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMBWidth.text = SMHeight
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMHeight
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMBWidth.attributedText = fractionMutableAttributedString(for: SMHeight, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMHeight
                
                self.lblSMBWidth.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMBWidth.text = SMHeight
            }
            //self.drawArea.addSubview(yourLabel)
            
            //Left
            yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 25, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
            yourLabel.backgroundColor = UIColor.clear
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.text = SMWidth
                    
                    self.lblSMLHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMLHeight.text = SMWidth
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMWidth
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMLHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMWidth
                
                self.lblSMLHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMLHeight.text = SMWidth
            }
            //lblSMLHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            //self.drawArea.addSubview(yourLabel)
            
            let point = CGSize(width: self.lblSMLHeight.frame.height , height: self.lblSMLHeight.frame.width)
            let animatr = ChainableAnimator(view: self.lblSMLHeight)
            animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
            

            
            //Right
            yourLabel = UILabel(frame: CGRect(x: frameRect.maxX - self.view.frame.width/4 - 25, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
            yourLabel.backgroundColor = UIColor.clear
            if ViewController.state.useInches{
                if unitState{
//                    yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                    yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.text = SMWidth
                    
                    self.lblSMRHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                    self.lblSMRHeight.text = SMWidth
                }
                else{
                    //yourLabel.textColor = updateContrastColor(selectedColor: colorBot)
                    //yourLabel.font = UIFont(name: "Exo", size: CGFloat(10))
//                    yourLabel.textAlignment = NSTextAlignment.center
//                    yourLabel.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorBot), size: 11)
                    //yourLabel.text = SMWidth
                    if UI_USER_INTERFACE_IDIOM() == .phone{
                        self.lblSMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 13)
                    }
                    else{
                        self.lblSMRHeight.attributedText = fractionMutableAttributedString(for: SMWidth, color: updateContrastColor(selectedColor: self.colorTop), size: 26)
                    }
                    
                }
            }
            else{
//                yourLabel.textColor = updateContrastColor(selectedColor: self.colorBot)
//                yourLabel.font = UIFont(name: "Exo", size: CGFloat(11))
//                yourLabel.textAlignment = NSTextAlignment.center
//                yourLabel.text = SMWidth
                
                self.lblSMRHeight.textColor = updateContrastColor(selectedColor: self.colorTop)
                self.lblSMRHeight.text = SMWidth
            }
            //lblSMRHeight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
            //self.drawArea.addSubview(yourLabel)
            
            let point1 = CGSize(width: self.lblSMRHeight.frame.height , height: self.lblSMRHeight.frame.width)
            let animatr1 = ChainableAnimator(view: self.lblSMRHeight)
            animatr1.make(backgroundColor: .clear).make(width: Float(point1.width)).make(height: Float(point1.height)).rotate(angle: -90).animate(t: 0.1)
            
        }
        
    }
    func redrawSingle(){
        
        
//        singleLayer.path = UIBezierPath.init(rect: frameRect).cgPath
//        singleLayer.fillColor = colorBot.cgColor
//
//        drawArea.layer.addSublayer(singleLayer)
//
//        let orig = frameRect.origin
//        var orig1 = frameRect.origin
//
//        var yourLabel: UILabel!
//
//        if(self.matState == 1){
//            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 40, width: self.view.frame.width/2, height: 30))
//
//        }
//        else if(self.matState == 0){
//            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 35, width: self.view.frame.width/2, height: 30))
//
//        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig1.y - 28, width: self.view.frame.width/2, height: 30))
//        }
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//        yourLabel.textColor = UIColor.black
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = self.SMW
//
//        self.drawArea.addSubview(yourLabel)
//
//
//        if(self.matState == 1){
//            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 27, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        }
//        else if(self.matState == 0){
//            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 17, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//
//        }
//        else {
//            yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 - 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        }
//        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(16))
//        yourLabel.textColor = UIColor.black
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = self.SMH
//        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
//
//        //        orig1 = imageRect.origin
//        //        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig1.y + 20, width: self.view.frame.width/2, height: 30))
//        //        yourLabel.backgroundColor = UIColor.clear
//        //        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
//        //        yourLabel.textColor = UIColor.white
//        //        yourLabel.textAlignment = NSTextAlignment.center
//        //        yourLabel.text = self.DMW
//        //        self.drawArea.addSubview(yourLabel)
//
//
//        //        yourLabel = UILabel(frame: CGRect(x: orig1.x - self.view.frame.width/4 + 25, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        //        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
//        //        yourLabel.textColor = UIColor.white
//        //        yourLabel.textAlignment = NSTextAlignment.center
//        //        yourLabel.text = self.DMH
//        //        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        //        self.drawArea.addSubview(yourLabel)
//
//
//        //Top
//        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4 - 15, y: orig.y , width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMHeight
//        yourLabel.superview?.bringSubview(toFront: self.drawArea)
//        self.drawArea.addSubview(yourLabel)
//
//
//        //Bottom
//        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 25 + frameRect.height, width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMHeight
//        self.drawArea.addSubview(yourLabel)
//
//        //Left
//        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 + 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMWidth
//        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
//
//        //Right
//        yourLabel = UILabel(frame: CGRect(x: frameRect.maxX - self.view.frame.width/4 - 15, y: frameRect.midY - 15, width: self.view.frame.width/2, height: 30))
//        yourLabel.backgroundColor = UIColor.clear
//        yourLabel.textColor = UIColor.white
//        yourLabel.font = UIFont(name: "Exo", size: CGFloat(15))
//        yourLabel.textAlignment = NSTextAlignment.center
//        yourLabel.text = SMWidth
//        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
//        self.drawArea.addSubview(yourLabel)
    }
    
    
    func drawBorder(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width + 20, height: self.frameRect.height + 20)))
        
        k.backgroundColor = UIColor(hexString: "#81460d")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        //self.drawArea.addSubview(k)
    }
    
    func drawBorder2(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width + 40, height: self.frameRect.height + 30)))
        
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
                
                
                self.lblSMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))in"
            }
            else
            {
                //labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72)) \""
                //labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                //labeTop.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                
//                self.lblSMImageWidth.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblSMImageWidth.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageWidth / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                self.lblSMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))m"
                
            }
            else{
                labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                self.lblSMImageWidth.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
                
            }
//            labeTop.textColor =  updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
//            labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        self.lblSMImageWidth.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        
        labeTop.frame.origin = k.bounds.origin;
        labeTop.center = CGPoint(x: k.bounds.midX, y: 10);
        //k.addSubview(labeTop)
        
        
        
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        if ViewController.state.useInches {
            if unitState {
                labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
                labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
                
                self.lblSMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))in"
                
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
                //labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
                //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
//                labelLeft.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                if UI_USER_INTERFACE_IDIOM() == .phone{
                    self.lblSMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 15)
                }
                else{
                    self.lblSMImageHeight.attributedText = fractionMutableAttributedString(for: "\(String(format: "%.0f", actualImageHeight / 72)) ″", color: updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6")), size: 30)
                }
                
            }
            
        }
        else {
            if unitState{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
                self.lblSMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))m"
                
            }
            else{
                //labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
                self.lblSMImageHeight.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
                
            }
            //labelLeft.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
            //labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        }
        
        self.lblSMImageHeight.textColor = updateContrastColor(selectedColor: UIColor(hexString: "#EBE2C6"))
        labelLeft.frame.origin = k.bounds.origin;
        //labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        //k.addSubview(labelLeft)
        
        let point = CGSize(width: self.lblSMImageHeight.frame.height , height: self.lblSMImageHeight.frame.width)
        let animatr = ChainableAnimator(view: self.lblSMImageHeight)
        animatr.make(backgroundColor: .clear).make(width: Float(point.width)).make(height: Float(point.height)).rotate(angle: -90).animate(t: 0.11)
        

        
        
    }
    
    
    func drawTripleImage(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 150, height: self.frameRect.height - 150)))
        
        k.backgroundColor = UIColor(hexString: "#EBE2C6")
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        self.drawArea.addSubview(k)
        
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        if ViewController.state.useInches {
            labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))\""
        }
        else {
            labeTop.text = "\(String(format: "%.0f", actualImageWidth / 72))cm"
        }
        
        labeTop.textColor = UIColor.black
        labeTop.frame.origin = k.bounds.origin;
        labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        labeTop.center = CGPoint(x: k.bounds.midX, y: 10);
        k.addSubview(labeTop)
        
        
        
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        if ViewController.state.useInches {
            labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))\""
        }
        else {
            labelLeft.text = "\(String(format: "%.0f", actualImageHeight / 72))cm"
        }
        labelLeft.textColor = UIColor.black
        labelLeft.frame.origin = k.bounds.origin;
        labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 10, y: k.bounds.midY);
        k.addSubview(labelLeft)
        
    }
    
    
    
    func drawTriple1Image(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 130, height: self.frameRect.height - 130)))
        
        k.backgroundColor = tripleColor1
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        self.drawArea.addSubview(k)
        
        
        //TOP
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        var rational = rationalApproximationOf(x0: tripleBottom/72)
        
        if ViewController.state.useInches {
            
            if(rational.den == 1){
                labeTop.text = String("\(rational.num)\"")
            }
                
            else {
                labeTop.text = String("\(rational.num)/\(rational.den)\"")
            }
            
        } else {
            let cmText = tripleBottom / 72
            labeTop.text = String(format: "%.02f", cmText) + "cm"
        }
        //        labeTop.text = String(format: "%.0f", actualImageWidth / 72)
        labeTop.textColor = UIColor(hexString: "#cccccc")
        labeTop.frame.origin = k.bounds.origin;
        labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labeTop.center = CGPoint(x: k.bounds.midX+15, y: 4);
        k.addSubview(labeTop)
        
        
        
        //Bottom
        
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.center = k.center
        labelBottom.textAlignment = .center
        
        
        if ViewController.state.useInches {
            
            if(rational.den == 1){
                labelBottom.text = String("\(rational.num)")
            }
                
            else {
                labelBottom.text = String("\(rational.num)/\(rational.den)\"")
            }
        }
        else {
            let cmText = tripleBottom / 72
            labelBottom.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelBottom.textColor = UIColor(hexString: "#cccccc")
        labelBottom.frame.origin = k.bounds.origin;
        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelBottom.center = CGPoint(x: k.bounds.midX+15, y: k.bounds.maxY - 4);
        k.addSubview(labelBottom)
        
        
        
        //LEFT
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        var rational1 = rationalApproximationOf(x0: tripleBottom/72)
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelLeft.text = String("\(rational1.num)\"")
            }
                
            else {
                labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
            }
        }
        else {
            let cmText = tripleBottom / 72
            labelLeft.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelLeft.textColor = UIColor(hexString: "#cccccc")
        labelLeft.frame.origin = k.bounds.origin;
        labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 4, y: k.bounds.midY+15);
        k.addSubview(labelLeft)
        
        
        //Right
        
        let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelRight.textAlignment = .center
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelRight.text = String("\(rational1.num)\"")
            }
                
            else {
                labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
            }
            
        }
        else {
            let cmText = tripleBottom / 72
            labelRight.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelRight.textColor = UIColor(hexString: "#cccccc")
        labelRight.frame.origin = k.bounds.origin;
        labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelRight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelRight.center = CGPoint(x: k.bounds.maxX-4, y: k.bounds.midY+15);
        k.addSubview(labelRight)
        
        
    }
    
    func drawTriple2Image(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.frameRect.width - 110, height: self.frameRect.height - 110)))
        
        k.backgroundColor = tripleColor2
        
        k.center = CGPoint(x: self.frameRect.midX, y: self.frameRect.midY);
        
        
        self.drawArea.addSubview(k)
        
        
        //Top
        
        let labeTop = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labeTop.center = k.center
        labeTop.textAlignment = .center
        
        var rational = rationalApproximationOf(x0: tripleMiddle/72)
        if ViewController.state.useInches {
            
            if(rational.den == 1){
                labeTop.text = String("\(rational.num)\"")
            }
                
            else {
                labeTop.text = String("\(rational.num)/\(rational.den)\"")
            }
        }
        else {
            let cmText = tripleMiddle / 72
            labeTop.text = String(format: "%.02f", cmText) + "cm"
        }
        
        
        labeTop.textColor = UIColor(hexString: "#cccccc")
        labeTop.frame.origin = k.bounds.origin;
        labeTop.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labeTop.center = CGPoint(x: k.bounds.midX, y: 4);
        k.addSubview(labeTop)
        
        
        //Bottom
        
        
        let labelBottom = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelBottom.center = k.center
        labelBottom.textAlignment = .center
        
        if ViewController.state.useInches {
            if(rational.den == 1){
                labelBottom.text = String("\(rational.num)\"")
            }
                
            else {
                labelBottom.text = String("\(rational.num)/\(rational.den)\"")
            }
        }
        else {
            let cmText = tripleMiddle / 72
            labelBottom.text = String(format: "%.02f", cmText) + "cm"
        }
        
        
        labelBottom.textColor = UIColor(hexString: "#cccccc")
        labelBottom.frame.origin = k.bounds.origin;
        labelBottom.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelBottom.center = CGPoint(x: k.bounds.midX, y: k.bounds.maxY - 4);
        k.addSubview(labelBottom)
        
        //LEFT
        
        let labelLeft = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelLeft.textAlignment = .center
        
        var rational1 = rationalApproximationOf(x0: tripleMiddle/72)
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelLeft.text = String("\(rational1.num)\"")
            }
                
            else {
                labelLeft.text = String("\(rational1.num)/\(rational1.den)\"")
            }
            
        }
        else {
            let cmText = tripleMiddle / 72
            labelLeft.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelLeft.textColor = UIColor(hexString: "#cccccc")
        labelLeft.frame.origin = k.bounds.origin;
        labelLeft.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelLeft.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelLeft.center = CGPoint(x: 4, y: k.bounds.midY);
        k.addSubview(labelLeft)
        
        
        //RIGHT
        
        
        let labelRight = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelRight.textAlignment = .center
        
        if ViewController.state.useInches {
            
            if(rational1.den == 1){
                labelRight.text = String("\(rational1.num)\"")
            }
                
            else {
                labelRight.text = String("\(rational1.num)/\(rational1.den)\"")
            }
            
        }
        else {
            let cmText = tripleMiddle / 72
            labelRight.text = String(format: "%.02f", cmText) + "cm"
        }
        
        labelRight.textColor = UIColor(hexString: "#cccccc")
        labelRight.frame.origin = k.bounds.origin;
        labelRight.font = UIFont(name: "Exo-Bold", size: CGFloat(9))
        labelRight.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        labelRight.center = CGPoint(x: k.bounds.maxX-4, y: k.bounds.midY);
        k.addSubview(labelRight)
        
        
    }
    
    
    func drawDouble(){
        if imageRect.height > frameRect.height
        {
            imageRect.size.height = frameRect.height - 20
            if imageRect.height < 0{
                imageRect.size.height = 0
            }
        }
        
        
        if imageRect.width > frameRect.width
        {
            imageRect.size.width = frameRect.width - 20
            if imageRect.width < 0{
                imageRect.size.width = 0
            }
        }
        
        imageRect.origin = CGPoint(x: frameRect.midX - (imageRect.width / 2), y:  frameRect.midY - (imageRect.height / 2))
        
        //        self.frameRect = rect
        
        
        doubleLayer.path = UIBezierPath.init(rect: self.imageRect).cgPath
        doubleLayer.fillColor = UIColor.clear.cgColor
        doubleLayer.lineWidth = 30
        doubleLayer.strokeColor = colorMid.cgColor
        
        drawArea.layer.addSublayer(doubleLayer)
        
        
        //TOP
        
        let orig = frameRect.origin
        var yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 20 , width: self.view.frame.width/2, height: 30))
        
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMW)\""
        }
        self.drawArea.addSubview(yourLabel)
        
        
        
        // LEft
        //yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 - 10, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMH)\""
        }
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        
        
        //Right
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4 - 10, y: frameRect.midY - 15 , width: self.view.frame.width/2, height: 30))
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMH)\""
        }
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        
        
        //Bottom
        
        yourLabel = UILabel(frame: CGRect(x: frameRect.midX - self.view.frame.width/4, y: orig.y - 20 , width: self.view.frame.width/2, height: 30))
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        if(matState == 1){
            var rational = rationalApproximationOf(x0: doubleBottom/72)
            
            yourLabel.text = String("\(rational.num)/\(rational.den)\"")
        }
        else {
            yourLabel.text = "\(self.DMH)\""
        }
        self.drawArea.addSubview(yourLabel)
        
        
        
        //Top
        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y - 5 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMHeight
        self.drawArea.addSubview(yourLabel)
        
        //Bottom
        yourLabel = UILabel(frame: CGRect(x: imageRect.midX - self.view.frame.width/4, y: orig.y - 5 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMHeight
        self.drawArea.addSubview(yourLabel)
        
        //Left
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMWidth
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        //Right
        yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        //yourLabel.textColor = UIColor.green
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        yourLabel.text = DMWidth
        
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
    }
    
    
    
    func drawTriple(){
        var rect :CGRect! = imageRect
        rect?.size.width -= 20
        rect?.size.height -= 20
        
        
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
        layer.lineWidth = 30
        layer.strokeColor = colorTop.cgColor
        
        drawArea.layer.addSublayer(layer)
        let orig = rect?.origin
        var yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! + 20, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.TMW
        self.drawArea.addSubview(yourLabel)
        
        
        yourLabel = UILabel(frame: CGRect(x: (orig?.x)! - self.view.frame.width/4 + 25, y: imageRect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.TMH
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        //Top
        yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! - 5 , width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr = TMHeight.components(separatedBy: ".")
            
            var firstNum: String = numArr[0]
            var secondNum: String = numArr[1]
            
            if(secondNum == "0\""){
                yourLabel.text = "\(firstNum)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMHeight
        }
        self.drawArea.addSubview(yourLabel)
        
        //Bottom
        yourLabel = UILabel(frame: CGRect(x: rect.midX - self.view.frame.width/4, y: (orig?.y)! - 15 + rect.height, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr1 = TMHeight.components(separatedBy: ".")
            
            var firstNum1: String = numArr1[0]
            var secondNum1: String = numArr1[1]
            
            if(secondNum1 == "0\""){
                yourLabel.text = "\(firstNum1)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum1.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum1) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMHeight
        }
        
        self.drawArea.addSubview(yourLabel)
        
        //Left
        yourLabel = UILabel(frame: CGRect(x: (orig?.x)! - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr2 = TMWidth.components(separatedBy: ".")
            
            var firstNum2: String = numArr2[0]
            var secondNum2: String = numArr2[1]
            
            if(secondNum2 == "0\""){
                yourLabel.text = "\(firstNum2)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum2.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum2) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMWidth
        }
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
        
        //Right
        yourLabel = UILabel(frame: CGRect(x: rect.maxX - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.textColor = UIColor(hexString: "#cccccc")
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(13))
        yourLabel.textAlignment = NSTextAlignment.center
        
        if ViewController.state.useInches {
            
            let numArr3 = TMWidth.components(separatedBy: ".")
            
            var firstNum3: String = numArr3[0]
            var secondNum3: String = numArr3[1]
            
            if(secondNum3 == "0\""){
                yourLabel.text = "\(firstNum3)\""
            }
            else {
                var rational = rationalApproximationOf(x0: Double("0.\(secondNum3.replacingOccurrences(of: "\"", with: ""))")!)
                
                yourLabel.text = " \(firstNum3) \(String("\(rational.num)/\(rational.den)") )\""
            }
        }
        else {
            yourLabel.text = TMWidth
        }
        
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        self.drawArea.addSubview(yourLabel)
    }
    
    
    func drawShape() {
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath.init(rect: self.frameRect).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 30
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
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        //        yourLabel.text = self.wText
       // self.drawArea.addSubview(yourLabel)
    }
    
    func addLabels2(_ rect:CGRect){
        let orig = rect.origin
        let yourLabel = UILabel(frame: CGRect(x: orig.x - self.view.frame.width/4, y: rect.midY - 15, width: self.view.frame.width/2, height: 30))
        yourLabel.backgroundColor = UIColor.clear
        yourLabel.font = UIFont(name: "Exo-Bold", size: CGFloat(15))
        yourLabel.textColor = UIColor.white
        yourLabel.textAlignment = NSTextAlignment.center
        
        //        yourLabel.text = self.hText
        
        yourLabel.transform = CGAffineTransform(rotationAngle: -1 * (CGFloat.pi/2))
        //self.drawArea.addSubview(yourLabel)
    }
    
}

