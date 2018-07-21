//
//  ValueScale.swift
//  Tasks
//
//  Created by Kevin Bai on 2018-01-02.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import Foundation
import UIKit

//all are scaled to iPhone SE/5S screen
class ValueScale {
    static let originalWidth: CGFloat = 320.0
    static let originalHeight: CGFloat = 568.0
    static let originalRatio: CGFloat = 320.0 / 568.0
    
    static let iPhoneXWidth: CGFloat = 375.0
    static let iPhoneXHeight: CGFloat = 812.0
    
    static let iPadRatioThreshold: CGFloat = 1
    
    static var isiPhoneX: Bool {
        get {
            return UIScreen.main.bounds.width == ValueScale.iPhoneXWidth && UIScreen.main.bounds.height == ValueScale.iPhoneXHeight
        }
    }
    static var isiPad: Bool {
        get {
            return (UIScreen.main.bounds.width / UIScreen.main.bounds.height) >= 0.6
        }
    }
}

extension Int {
    var scaled: CGFloat {
        get {
            // take the average of the new width and height, divide it by the average of the old width and height
            // then multiply by the ratio of the ratio of the new screen with the ratio of the original screen if it is an iphone x
            if ValueScale.isiPhoneX {
                return CGFloat(self) * (UIScreen.main.bounds.width + UIScreen.main.bounds.height) / (ValueScale.originalWidth + ValueScale.originalHeight) * (UIScreen.main.bounds.width * ValueScale.originalHeight) / (UIScreen.main.bounds.height * ValueScale.originalWidth)
            }
            else {
                return CGFloat(self) * (UIScreen.main.bounds.width + UIScreen.main.bounds.height) / (ValueScale.originalWidth + ValueScale.originalHeight)
            }
        }
    }
    
    var radians: CGFloat {
        get {
            return CGFloat(self).radians
        }
    }
}

extension Double {
    var scaled: CGFloat {
        get {
            // take the average of the new width and height, divide it by the average of the old width and height
            // then multiply by the ratio of the ratio of the new screen with the ratio of the original screen if it is an iphone x
            if ValueScale.isiPhoneX {
                return CGFloat(self) * (UIScreen.main.bounds.width + UIScreen.main.bounds.height) / (ValueScale.originalWidth + ValueScale.originalHeight) * (UIScreen.main.bounds.width * ValueScale.originalHeight) / (UIScreen.main.bounds.height * ValueScale.originalWidth)
            }
            else {
                return CGFloat(self) * (UIScreen.main.bounds.width + UIScreen.main.bounds.height) / (ValueScale.originalWidth + ValueScale.originalHeight)
            }
            
        }
    }
    var radians: CGFloat {
        get {
            return CGFloat(self).radians
        }
    }
}

extension CGFloat {
    var radians: CGFloat {
        get {
            return self / 180.0 * CGFloat.pi
        }
    }
}

