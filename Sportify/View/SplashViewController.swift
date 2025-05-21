//
//  SplashViewController.swift
//  Sportify
//
//  Created by Abdullah Raed on 19/05/2025.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = LottieAnimationView(name: "splash")
        guard let animationView = animationView else { return }
        animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        animationView.backgroundColor = .white
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .repeat(1)
        animationView.animationSpeed = 1
        animationView.play { completed in
            self.goToHome()
        }
        
        self.view.addSubview(animationView)
    }
    
    func goToHome() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tapBar") as! TabBar
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = scene.delegate as? SceneDelegate,
           let window = delegate.window {
            self.navigationController?.pushViewController(vc, animated: true)
            window.rootViewController = UINavigationController(rootViewController: vc)
            window.makeKeyAndVisible()
        }
        
    }
}
