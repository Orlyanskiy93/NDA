//
//  StackViewButton.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 05.05.2021.
//

import UIKit

class StackViewButton: UIButton {
    private let blackColor: UIColor = UIColor.black
    private let blueColor: UIColor = UIColor(named: "NDBlue") ?? .systemBlue
    private let greenColor: UIColor = UIColor(named: "NDGreen") ?? .systemGreen
    private let darkGreenColor: UIColor = UIColor(named: "NDDarkGreen") ?? .green
    private let clearColor: UIColor = .clear
    
    var identifier: Int = 0
    var buttonState: ButtonState = .notAnswered {
        didSet {
            updateView()
        }
    }
        
    override var isSelected: Bool {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    private func setup() {
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 5
        self.tintColor = .clear
        self.setTitleColor(.black, for: .selected)
        self.setTitleColor(.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        isSelected = false
        buttonState = .notAnswered
    }
    
    private func updateView() {
        updateBorderColor()
        updateBackgroundColor()
        updateTitleColor()
    }
    
    private func updateBorderColor() {
        if buttonState == .answered {
            layer.borderColor = isSelected ? blueColor.cgColor : darkGreenColor.cgColor
        }
        
        if buttonState == .notAnswered {
            layer.borderColor = isSelected ? blueColor.cgColor : blackColor.cgColor
        }
    }
    
    private func updateBackgroundColor() {
        if buttonState == .answered {
            backgroundColor = greenColor
        }
        
        if buttonState == .notAnswered {
            backgroundColor = clearColor
        }
    }
    
    private func updateTitleColor() {
        if buttonState == .answered {
            setTitleColor(darkGreenColor, for: .normal)
        }
        
        if buttonState == .notAnswered {
            setTitleColor(blackColor, for: .normal)
        }
    }
    
    private func answeredSetup() {
        backgroundColor = greenColor
        layer.borderColor = darkGreenColor.cgColor
        setTitleColor(darkGreenColor, for: .normal)
    }
    
    private func notAnsweredSetup() {
        backgroundColor = clearColor
    }
        
    private func setupConstraints() {
        let constraints = [
            NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension StackViewButton {
    enum ButtonState {
        case answered
        case notAnswered
    }
}
