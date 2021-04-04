//
//  MainRouter.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 25.03.2021.
//

import UIKit

class MainRouter {
    static var shared = MainRouter()
    var window: UIWindow!
    
    private init() {
        window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
    }
        
    func open(module: Module) {
        let storyboard = UIStoryboard(name: module.storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        
        UIView.transition(with: window, duration: 0.3, options: [.transitionFlipFromRight], animations: { [weak self] in
            self?.window.rootViewController = vc
        }, completion: nil)
    }

    func openInitialModule() {
        let user = UserDefaults.standard.object(forKey: User.key)
        if user != nil {
            open(module: .main)
        } else {
            open(module: .login)
        }
    }
}

extension MainRouter {
    enum Module {
        case login
        case main
        
        var storyboardName: String {
            switch  self {
            case .login:
                return "Login"
            case .main:
                return "Main"
            }
        }
    }
}
