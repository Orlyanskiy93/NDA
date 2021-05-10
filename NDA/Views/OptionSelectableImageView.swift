//
//  SelectableImage.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 02.04.2021.
//

import UIKit

protocol SelectableImageViewDelegate: AnyObject {
    func selectableImageView(didSelect selectableImageView: OptionSelectableImageView)
}

class OptionSelectableImageView: UIImageView {
    private(set) var option: Option?
    private let greenColor: UIColor = UIColor(named: "NDGreen") ?? .systemGreen
    
    var state: State = .notDetermined {
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
    
    weak var delegate: SelectableImageViewDelegate!
    private let coverSubview = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentMode = .scaleAspectFill
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(gestureRecognizer)
        self.isUserInteractionEnabled = true
    }
    
    func fill(with option: Option) {
        self.option = option
        let name = option.value
        self.image = UIImage(named: name)
    }
    
    private func baseColorSetup() {
        self.coverSubview.removeFromSuperview()
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
    }
    
    private func selectedColorSetup() {
        self.coverSubview.removeFromSuperview()
        self.layer.borderColor = greenColor.cgColor
        self.layer.borderWidth = 5
    }
    
    private func notSelectedColorSetup() {
        baseColorSetup()
        coverSubview.frame = self.bounds
        coverSubview.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.addSubview(coverSubview)
    }
    
    @objc private func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        state = .selected
        delegate.selectableImageView(didSelect: self)
    }
}

extension OptionSelectableImageView {
    enum State {
        case selected
        case notSelected
        case notDetermined
    }
}
