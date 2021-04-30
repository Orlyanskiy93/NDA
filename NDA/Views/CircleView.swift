//
//  CircleView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//

import UIKit

class CircleView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    private func setup() {
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor(named: "NDBlue")?.cgColor
    }

}
