//
//  SelectibleView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 17.04.2021.
//

import UIKit

class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        self.action(for: self.layer, forKey: "")
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.gray.cgColor
    }
}
