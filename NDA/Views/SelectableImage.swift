//
//  SelectableImage.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 02.04.2021.
//

import UIKit

protocol SelectableImageDelegate: class {
    func imageDidSelected(_ selectableImage: SelectableImage, with condition: SelectableImage.Condition)
 }

class SelectableImage: UIImageView {
    
    var isSelected: Bool = false
    weak var delegate: SelectableImageDelegate!
    let subview = UIView()
    let tasd = UITableView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(gestureRecognizer)
        self.isUserInteractionEnabled = true
    }
        
    func baseColorSetup() {
        self.subview.removeFromSuperview()
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
    }
    
    func selectedColorSetup() {
        self.subview.removeFromSuperview()
        self.layer.borderColor = UIColor.green.cgColor
        self.layer.borderWidth = 5
    }
    
    func notSelectedColorSetup() {
        baseColorSetup()
        subview.frame = self.bounds
        subview.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.addSubview(subview)
    }
    
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        if !isSelected {
            delegate.imageDidSelected(self, with: .selected)
        } else {
            delegate.imageDidSelected(self, with: .notSelected)
        }
    }
}

extension SelectableImage {
    enum Condition {
        case selected
        case notSelected
    }
}
