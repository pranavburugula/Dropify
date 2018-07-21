//
//  CustomFonts.swift
//  IanniMM
//
//  Created by Kevin Bai on 2018-04-09.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import UIKit

extension UIFont {
    enum FontType: String { case extraLight = "ExtraLight", extraLightItalic = "ExtraLightItalic", lightItalic = "LightItalic", light = "Light", regular = "Regular", italic = "Italic", medium = "Medium", mediumItalic = "MediumItalic", semiBold = "SemiBold", semiBoldItalic = "SemiBoldItalic", bold = "Bold", boldItalic = "BoldItalic", extraBold = "ExtraBold" }
    
    class func dosis(_ type: FontType, _ size: CGFloat) -> UIFont? {
        return UIFont(name: "Dosis-\(type)", size: size)
    }
    
    class func plex(_ type: FontType, _ size: CGFloat) -> UIFont? {
        return UIFont(name: "IBMPlexSans-\(type)", size: size)
    }
    class func source(_ type: FontType, _ size: CGFloat) -> UIFont? {
        return UIFont(name: "SourceSansPro-\(type)", size: size)
    }
}
