//
//  UIColorExtensions.swift
//  Tasks
//
//  Created by Kevin Bai on 2018-01-06.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import UIKit

extension UILabel {
    class func create(_ title: String, _ color: UIColor, _ font: UIFont?, textAlign: NSTextAlignment = .natural) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = color
        label.font = font
        label.textAlignment = textAlign
        return label
    }
}

extension UIButton {
    class func create(_ title: String, _ color: UIColor, _ font: UIFont?, textAlign: NSTextAlignment = .natural) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: [])
        button.setTitleColor(color, for: [])
        button.titleLabel?.font = font
        button.titleLabel?.textAlignment = textAlign
        return button
    }
}

extension UITextField {
    var placeholderColor: UIColor? {
        get {
            return self.placeholderColor
        }
        set(value) {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : value ?? UIColor.white])
        }
    }
}

extension UIColor {
    class func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}

extension UIView {
    func layoutRootView() {
        guard let view = self.superview else {
            return self.layoutIfNeeded()
        }
        return view.layoutRootView()
    }
    func getRootViewImage() -> UIImage? {
        let rootView = getRootView()
        return rootView.getImage()
    }
    func getImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    private func getRootView() -> UIView {
        guard let view = self.superview else {
            return self
        }
        return view
    }
}

extension UIViewController {
    func getRootVC() -> UIViewController {
        guard let vc = self.parent else { return self }
        return vc.getRootVC()
    }
}

extension NSMutableAttributedString {
    // get attributed string from a formula string
    class func attributedFormulaFrom(_ formula: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: formula)
        if formula.count > 0 {
            var prevSubscripted = false
            for index in 1..<formula.count {
                let i = formula.index(formula.startIndex, offsetBy: index)
                let prevI = formula.index(before: i)
                let asciiValue = Int(formula[i].unicodeScalars.first!.value)
                let prevAscii = Int(formula[prevI].unicodeScalars.first!.value)
                // if it is a number and it comes after a bracket or a letter, then it is subscripted
                if asciiValue >= 48 && asciiValue <= 57 {
                    if prevAscii < 48 || prevAscii > 57 {
                        if String(formula[prevI]) != "•" {
                            let range = NSRange(location: index, length: 1)
                            attributedString.addAttribute(NSAttributedStringKey.baselineOffset, value: -5, range: range)
                            attributedString.addAttribute(NSAttributedStringKey.font, value: UIFont.dosis(.light, 12.scaled)!, range: range)
                            prevSubscripted = true
                        }
                        else { prevSubscripted = false }
                    }
                    else if prevSubscripted {
                        let range = NSRange(location: index, length: 1)
                        attributedString.addAttribute(NSAttributedStringKey.baselineOffset, value: -5, range: range)
                        attributedString.addAttribute(NSAttributedStringKey.font, value: UIFont.dosis(.light, 12.scaled)!, range: range)
                        prevSubscripted = true
                    }
                    
                }
            }
        }
        
        return attributedString
    }
}

extension UIImage {
    class func fill(bounds: CGRect, color: UIColor = UIColor.rgb(200,200,200)) -> UIImage? {
        UIGraphicsBeginImageContext(bounds.size)
        color.setFill()
        UIRectFill(bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

extension UIImageView {
    func downloadImageFromUrl(_ url: String) {
        // put a placeholder in while image is loading
        //self.image = UIImage.fill(bounds: self.bounds)
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) -> Void in
            guard let usableData = data else { return }
            DispatchQueue.main.async {
                self?.image = UIImage(data: usableData)
            }
        }).resume()
    }
}
