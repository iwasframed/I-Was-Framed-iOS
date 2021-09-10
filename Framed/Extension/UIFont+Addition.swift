//
//  UIFont+Addition.swift
//  Framed
//
//  Created by Adeel on 04/10/2019.
//  Copyright © 2019 ebmacs. All rights reserved.
//

import UIKit

class UIFont_Addition: NSObject {

}
extension UIFont {
    static func fractionFont(ofSize pointSize: CGFloat) -> UIFont
    {
        //let systemFontDesc = UIFont(name: "Exo", size: pointSize)?.fontDescriptor
        let systemFontDesc = UIFont.systemFont(ofSize: pointSize).fontDescriptor
        
        let fractionFontDesc = systemFontDesc.addingAttributes(
            [
                UIFontDescriptor.AttributeName.featureSettings: [
                    [
                        UIFontDescriptor.FeatureKey.featureIdentifier: kFractionsType,
                        UIFontDescriptor.FeatureKey.typeIdentifier: kDiagonalFractionsSelector,
                    ], ]
            ] )
        return UIFont(descriptor: fractionFontDesc, size:pointSize)
    }
    func stylizeFonts(size: CGFloat) -> [NSAttributedStringKey: Any]{
        let normalFont = UIFont.systemFont(ofSize: size)
        //let boldFont = UIFont.systemFont(ofSize: size, weight: .bold)
        
        let normalTextAttributes: [NSAttributedStringKey: Any] = [.font: normalFont]
        
        return normalTextAttributes
        
        
    }
}
extension UISegmentedControl{
    func stateNormalFonts(size: CGFloat){
        let normalFont = UIFont.systemFont(ofSize: size)
        //let boldFont = UIFont.systemFont(ofSize: size, weight: .bold)
        
        let normalTextAttributes: [NSAttributedStringKey: Any] = [.font: normalFont]
        self.setTitleTextAttributes(normalTextAttributes, for: .normal)
        
        
        
    }
}
