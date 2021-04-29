//
//  SelectableButton.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 07.04.2021.
//

import UIKit

class OptionSelectableButton: RoundedButton {
    private(set) var option: Option?
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor(named: "NDGreen") : UIColor(named: "NDLightGrey")
            isUserInteractionEnabled = isSelected ? false : true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTitleColor(.black, for: .normal)
        setTitleColor(.white, for: .selected)
        self.tintColor = .clear
    }
    
    func fill(with option: Option) {
        self.option = option
        let title = option.value
        self.setTitle(title, for: .normal)
    }
    
}
