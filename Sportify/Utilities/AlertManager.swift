//
//  AlertManager.swift
//  Sportify
//
//  Created by Abdullah Raed on 18/05/2025.
//

import Foundation
import SwiftMessages

class AlertManager {
    
    static func showErrorAlert(title : String , bodyContent : String , buttonTitle : String ,buttonAction : @escaping (UIButton)-> Void ){
        let view = MessageView.viewFromNib(layout: .centeredView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: title, body: bodyContent, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: buttonTitle , buttonTapHandler: buttonAction)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        SwiftMessages.show(view: view)
    }
    
    static func showWariningAlert(title : String , bodyContent : String , buttonTitle : String ,buttonAction : @escaping (UIButton)-> Void){
        let view = MessageView.viewFromNib(layout: .centeredView)
        view.configureTheme(.warning)
        view.configureDropShadow()
        view.configureContent(title: title, body: bodyContent, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: buttonTitle, buttonTapHandler: buttonAction)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        SwiftMessages.show(view: view)
    }
    
    static func showSuccessAlert(title : String , bodyContent : String , buttonTitle : String ,buttonAction : @escaping (UIButton)-> Void){
        let view = MessageView.viewFromNib(layout: .centeredView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.configureContent(title: title, body: bodyContent, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: buttonTitle, buttonTapHandler: buttonAction)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        SwiftMessages.show(view: view)
    }
    
}
