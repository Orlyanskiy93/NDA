//
//  UIViewController+ViewGestureRecognizer.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 07.05.2021.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTaped() {
        let gestuteRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        gestuteRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(gestuteRecognizer)
        self.view.isUserInteractionEnabled = true
    }
    
    @objc private func endEditing() {
        self.view.endEditing(true)
    }
}
