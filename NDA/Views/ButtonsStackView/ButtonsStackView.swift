//
//  ButtonsStackView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 05.05.2021.
//

import UIKit

protocol ButtonsStackViewDelegate: AnyObject {
    func buttonsStackView(didSelected button: StackViewButton)
}

class ButtonsStackView: UIStackView {
    weak var delegate: ButtonsStackViewDelegate?
    private(set) var buttons: [StackViewButton] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        distribution = .fillEqually
        spacing = 10
    }
    
    func createButtons(count: Int) {
        for i in 0..<count {
            let button = StackViewButton()
            button.setTitle("\(i + 1)", for: .normal)
            button.identifier = i
            button.addTarget(self, action: #selector(didSelected(_:)), for: .touchUpInside)
            buttons.append(button)
            addArrangedSubview(button)
        }
    }
    
    @objc func didSelected(_ button: StackViewButton) {
        button.isSelected = true
        delegate?.buttonsStackView(didSelected: button)
    }
    
    func setSelected(index: Int, _ isEnabled: Bool) {
        buttons.forEach { button in
            button.isSelected = false
        }
        buttons[index].isSelected = true
        buttons[index].isEnabled = isEnabled
    }
    
    func setButtonState(index: Int, to state: StackViewButton.ButtonState) {
        buttons[index].buttonState = state
    }
    
}
