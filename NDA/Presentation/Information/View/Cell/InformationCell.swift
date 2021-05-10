//
//  InformationCell.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 09.05.2021.
//

import UIKit

class InformationCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    var content: Content = .rolled {
        didSet {
            switch content {
            case .rolled:
                rollUpContent()
            case .unrolled:
                unrollContent()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        descriptionLabel.contentMode = .top
        content = .rolled
    }

    func fill(with tuple: (title: String, description: String)) {
        titleLabel.text = tuple.title
        descriptionLabel.text = tuple.description
    }
    
    func rollUpContent() {        
        UIView.animate(withDuration: 0.7) { [weak self] in
            self?.descriptionLabel.numberOfLines = 2
            self?.arrowImageView.transform = .identity
        }
    }
    
    func unrollContent() {
        let rotationAngle = CGFloat.pi
        UIView.animate(withDuration: 0.7) { [weak self] in
            self?.descriptionLabel.numberOfLines = 0
            self?.arrowImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
}

extension InformationCell {
    enum Content {
        case rolled
        case unrolled
    }
}
