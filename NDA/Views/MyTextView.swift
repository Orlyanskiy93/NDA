//
//  TextView+borders+placeholder.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 28.04.2021.
//

import UIKit

class MyTextView: UITextView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "NDLightGrey")?.cgColor
    }
    
}
