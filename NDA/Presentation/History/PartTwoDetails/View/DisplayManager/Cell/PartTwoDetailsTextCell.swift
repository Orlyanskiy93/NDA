//
//  PartTwoDetailsTextCell.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 19.04.2021.
//

import UIKit

class PartTwoDetailsTextCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var isCorrectLabel: UILabel!
    @IBOutlet weak var responseTimeLabel: UILabel!
    @IBOutlet weak var responseTimeValueLabel: UILabel!
    
    func fill(with answer: AnswerPartTwo) {
        questionLabel.text = answer.question
        yourAnswerLabel.text = String.History.yourAnswer
        responseTimeLabel.text = String.History.responceTime
        responseTimeValueLabel.text = answer.time.rounded().description + "s"
        optionButton.setTitle(answer.option.value, for: .normal)
        
        if answer.option.isRight {
            optionButton.backgroundColor = .green
            isCorrectLabel.text = String.History.correct
        } else {
            optionButton.backgroundColor = .red
            isCorrectLabel.text = String.History.incorrect
        }
    }
    
}
