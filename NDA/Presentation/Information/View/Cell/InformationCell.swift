//
//  InformationCell.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 09.05.2021.
//

import UIKit

class InformationCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    var isChosen: Bool = false {
        didSet {
            isChosen ? unrollContent() : rollUpContent()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        answerLabel.contentMode = .top
        answerLabel.numberOfLines = 2
    }

    func fill(with faq: FAQ) {
        questionLabel.text = faq.question
        answerLabel.text = faq.answer
    }
    
    private func rollUpContent() {
        answerLabel.numberOfLines = 2

        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.arrowImageView.transform = .identity
        }
    }
    
    private func unrollContent() {
        answerLabel.numberOfLines = 0

        let rotationAngle = CGFloat.pi
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.arrowImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
}
