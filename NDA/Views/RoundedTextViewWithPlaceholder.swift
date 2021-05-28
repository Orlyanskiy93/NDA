//
//  TextView+borders+placeholder.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 28.04.2021.
//

import UIKit
import KMPlaceholderTextView

class RoundedTextViewWithPlaceholder: KMPlaceholderTextView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        let lightGreyColor = UIColor(named: "NDLightGrey") ?? .lightGray
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = lightGreyColor.cgColor
        placeholder = String.PartThree.placeholder
    }
    
}
