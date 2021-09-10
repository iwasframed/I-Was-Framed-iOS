//
//  UIViewController+Addition.swift
//  Framed
//
//  Created by Adeel on 04/10/2019.
//  Copyright © 2019 ebmacs. All rights reserved.
//

import UIKit

class UIViewController_Addition: NSObject {

}
extension Bundle {
    var displayName: String? {
        //return object(forInfoDictionaryKey: "CFBundleName") as? String
        return "I Was Framed"
    }
}
extension String {
   var containsSpecialCharacter: Bool {
      let regex = ".*[^A-Za-z0-9#].*"
      let testString = NSPredicate(format:"SELF MATCHES %@", regex)
      return testString.evaluate(with: self)
   }
    func removeSpecialCharsFromString() -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890#")
        return String(self.filter {okayChars.contains($0) })
    }
    
}
extension UIViewController
{
    func rationalApproximationOf(x0 : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
        var x = x0
        var a = floor(x)
        var (h1, k1, h, k) = (1, 0, Int(a), 1)
        
        while x - a > eps * Double(k) * Double(k) {
            x = 1.0/(x - a)
            a = floor(x)
            (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
        }
        return (h, k)
    }
    func updateContrastColor(selectedColor: UIColor) -> UIColor {
        //Chameleon.setGlobalThemeUsingPrimaryColor(selectedColor, with: .contrast)
        
        let contrastingColor = UIColor(contrastingBlackOrWhiteColorOn:selectedColor, isFlat: true)
        
        return contrastingColor
    }
    //    func updateIntoFraction(size: CGFloat, label: UILabel) -> UILabel {
    //        let pointSize = size
    //        let systemFontDesc = UIFont.systemFont(ofSize: pointSize,
    //                                               weight: UIFont.Weight.light).fontDescriptor
    //        let fractionFontDesc = systemFontDesc.addingAttributes(
    //            [
    //                UIFontDescriptor.AttributeName.featureSettings: [
    //                    [
    //                        UIFontDescriptor.FeatureKey.featureIdentifier: kFractionsType,
    //                        UIFontDescriptor.FeatureKey.typeIdentifier: kDiagonalFractionsSelector,
    //
    //                        ],
    //                ]
    //            ] )
    //
    //        //let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    //
    //        label.font = UIFont(descriptor: fractionFontDesc, size:pointSize)
    //        let subString = label.text?.split(separator: " ")
    //        if subString![1].contains("/") {
    //
    //        }
    //        return label
    //    }
    func fractionMutableAttributedString(for string: String,  color:UIColor , size: CGFloat) -> NSAttributedString {
        
        let attributes: [NSAttributedStringKey: Any] = [.foregroundColor: color, .font: UIFont.systemFont(ofSize: size, weight: .semibold)]
        let str = string.replacingOccurrences(of: " ", with: "", options: .literal, range: string.range(of: " ″"))
        let attributedText = NSMutableAttributedString(string: str, attributes: attributes)
        
        let substring = string.split(separator: " ") // Do we have a fractional value?
        if substring[0].contains("/") {
            let range = (string as NSString).range(of: String(substring[0]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedStringKey.font, value: UIFont.fractionFont(ofSize: size), range: range)
        }
        else if substring[1].contains("/"){
            let range = (string as NSString).range(of: String(substring[1]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedStringKey.font, value: UIFont.fractionFont(ofSize: size), range: range)
        }
        
        
        return attributedText
        
    }
    func fractionMutableAttributedString1(for string: String,  color:UIColor , size: CGFloat) -> NSAttributedString {
        
        let attributes: [NSAttributedStringKey: Any] = [.foregroundColor: color, .font: UIFont.systemFont(ofSize: size, weight: .semibold)]
        //let str = string.replacingOccurrences(of: " ", with: "", options: .literal, range: string.range(of: " ″"))
        let attributedText = NSMutableAttributedString(string: string, attributes: attributes)
        
        let substring = string.split(separator: " ") // Do we have a fractional value?
        if substring[0].contains("/") {
            let range = (string as NSString).range(of: String(substring[0]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            if UI_USER_INTERFACE_IDIOM() == .phone{
                attributedText.addAttribute(NSAttributedStringKey.font, value: UIFont.fractionFont(ofSize: size + 5), range: range)
            }
            else{
                attributedText.addAttribute(NSAttributedStringKey.font, value: UIFont.fractionFont(ofSize: size + 10), range: range)
            }
            
        }
        else {
            
        }
        
        
        return attributedText
        
    }
    
}
