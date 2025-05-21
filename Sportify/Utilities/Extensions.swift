//
//  Extensions.swift
//  Sportify
//
//  Created by Abdullah Raed on 13/05/2025.
//



import Foundation
import UIKit

let shimmerLayerName = "shimmerLayer"

extension UIImage {

    var rounded: UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        let bounds = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: bounds, cornerRadius: size.height/2.0).addClip()
        draw(in: bounds)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UIView : @retroactive CAAnimationDelegate{
    
    func startShimmeringViewAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.name = shimmerLayerName
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        let gradientColorOne = UIColor(white: 0.85, alpha: 1.0).cgColor
        let gradientColorTwo = UIColor(white: 0.95, alpha: 1.0).cgColor
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = 0.3
        animation.duration = 0.9
        animation.delegate = self
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
    
    private func stopShimmeringViewAnimation() {
           if let sublayers = self.layer.sublayers {
               for layer in sublayers {
                   if layer.name == shimmerLayerName {
                       layer.removeFromSuperlayer()
                       break
                   }
               }
           }
       }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag{
            stopShimmeringViewAnimation()
        }
    }
}
