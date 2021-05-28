//
//  PartOneDetailsCell.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 18.04.2021.
//

import UIKit

class PartOneDetailsCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var answerValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func fill(with answer: AnswerPartOne) {
        questionLabel.text = answer.question
        yourAnswerLabel.text = String.History.yourAnswer
        answerValueLabel.text = answer.value.description
    }
}
