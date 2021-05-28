//
//  GradientView.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 27.05.2021.
//

import UIKit

class GradientView: UIView {
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    func setup(_ colors: [CGColor], _ locations: [NSNumber], _ startPoint: CGPoint, _ endPoint: CGPoint) {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        guard let gradientLayer = self.layer as? CAGradientLayer else {
            return
        }
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
    }
}
