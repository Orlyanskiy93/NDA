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
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor(named: "NDLightGrey")?.cgColor
    }
}
