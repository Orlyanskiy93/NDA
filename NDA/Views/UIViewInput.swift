//
//  UIViewInput.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 21.03.2021.
//

import Foundation
import UIKit

protocol UIViewInput {
    func show(_ error: Error, _ handler: ((UIAlertAction) -> Void)?)
    func show(title: String?, message: String, _ handler: ((UIAlertAction) -> Void)?)
}

extension UIViewInput {
    
    func show(_ error: Error, _ handler: ((UIAlertAction) -> Void)? = nil) {
        show(title: error.localizedDescription, message: String.Error.tryAgain, handler)
    }
    
    func show(title: String? = nil, message: String, _ handler: ((UIAlertAction) -> Void)? = nil) {
        guard let vc = self as? UIViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: String.Error.ok, style: .default, handler: handler)
        let actionCancel = UIAlertAction(title: String.Error.cancel, style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
