//
//  RoundedButoon.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 23.03.2021.
//

import UIKit

class RoundedButton: UIButton {
    let radius: CGFloat = 15
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        layer.cornerRadius = radius
    }
    
}
