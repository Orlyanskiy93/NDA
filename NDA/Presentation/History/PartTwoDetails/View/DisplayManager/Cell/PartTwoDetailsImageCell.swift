//
//  PartTwoDetailsCell.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 18.04.2021.
//

import UIKit

class PartTwoDetailsImageCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var optionImageView: UIImageView!
    @IBOutlet weak var isCorrectLabel: UILabel!
    @IBOutlet weak var responseTimeLabel: UILabel!
    @IBOutlet weak var responseTimeValueLabel: UILabel!
    
    func fill(with answer: AnswerPartTwo) {
        questionLabel.text = answer.question
        yourAnswerLabel.text = String.History.yourAnswer
        responseTimeLabel.text = String.History.responceTime
        responseTimeValueLabel.text = answer.time.rounded().description + "s"
        optionImageView.layer.borderWidth = 3
        
        let image = UIImage(named: answer.option.value)
        optionImageView.image = image
        
        if answer.option.isRight {
            optionImageView.layer.borderColor = UIColor.green.cgColor
            isCorrectLabel.text = String.History.correct
        } else {
            optionImageView.layer.borderColor = UIColor.red.cgColor
            isCorrectLabel.text = String.History.incorrect
        }
    }
}
