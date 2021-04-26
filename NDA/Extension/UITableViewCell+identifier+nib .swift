//
//  UITableViewCell+identifier+nib .swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//

import Foundation

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: .none)
    }
}
