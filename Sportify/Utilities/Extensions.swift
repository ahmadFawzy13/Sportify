//
//  Extensions.swift
//  Sportify
//
//  Created by Abdullah Raed on 13/05/2025.
//



import Foundation
import UIKit

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
