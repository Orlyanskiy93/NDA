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
        show(title: String.Error.error, message: error.localizedDescription, handler)
    }
    
    func show(title: String? = nil, message: String, _ handler: ((UIAlertAction) -> Void)? = nil) {
        guard let vc = self as? UIViewController else { return }
        let allert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: String.Error.ok, style: .cancel, handler: handler)
        allert.addAction(action)
        vc.present(allert, animated: true, completion: nil)
    }
}
