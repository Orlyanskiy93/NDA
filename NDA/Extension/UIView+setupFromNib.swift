//
//  UIView+setupFromNib.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 21.04.2021.
//

import UIKit

extension UIView {
    
    func setupFromNib() {
        guard let view = loadFromNib() else {
            return
        }
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func loadFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: nil)
        
        return nib.instantiate(withOwner: self).first as? UIView
    }
    
}
