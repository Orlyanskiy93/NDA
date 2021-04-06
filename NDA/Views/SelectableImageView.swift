//
//  SelectableImage.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 02.04.2021.
//

import UIKit

protocol SelectableImageDelegate: class {
    func selectableImageView(didSelect selectableImageView: SelectableImageView)
 }

class SelectableImageView: UIImageView {
    
    var state: Condition = .notDetermined {
        didSet {
            switch state {
            case .notDetermined:
                baseColorSetup()
            case .notSelected:
                notSelectedColorSetup()
            case .selected:
                selectedColorSetup()
            }
        }
    }
    
    weak var delegate: SelectableImageDelegate!
    // TODO
    private let subview = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentMode = .scaleAspectFill
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(gestureRecognizer)
        self.isUserInteractionEnabled = true
    }
        
    private func baseColorSetup() {
        self.subview.removeFromSuperview()
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
    }
    
    private func selectedColorSetup() {
        self.subview.removeFromSuperview()
        self.layer.borderColor = UIColor.green.cgColor
        self.layer.borderWidth = 5
    }
    
    private func notSelectedColorSetup() {
        baseColorSetup()
        subview.frame = self.bounds
        subview.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.addSubview(subview)
    }
    
    @objc private func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        state = .selected
        delegate.selectableImageView(didSelect: self)
    }
}

extension SelectableImageView {
    enum Condition {
        case selected
        case notSelected
        case notDetermined
    }
}
