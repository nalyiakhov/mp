//
//  UIColor.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 26.05.2021.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    static let text = UIColor(r: 55, g: 55, b: 55, alpha: 1.0)
    static let link = UIColor(r: 33, g: 150, b: 243, alpha: 1.0)
    static let background = UIColor(r: 238, g: 238, b: 238, alpha: 1.0)
    static let alphaBackground = UIColor(r: 55, g: 55, b: 55, alpha: 0.5)
}
