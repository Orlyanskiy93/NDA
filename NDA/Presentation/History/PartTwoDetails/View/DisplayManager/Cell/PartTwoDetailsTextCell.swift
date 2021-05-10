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
    @IBOutlet weak var checkImageView: UIImageView!
    
    let greenColor: UIColor? = UIColor(named: "NDGreen")
    let redColor: UIColor? = UIColor(named: "NDRed")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func fill(with answer: AnswerPartTwo) {
        questionLabel.text = answer.question
        yourAnswerLabel.text = String.History.yourAnswer
        responseTimeLabel.text = String.History.responceTime
        responseTimeValueLabel.text = Double(answer.time).rounded(digits: 2).description + "s"
        optionButton.setTitle(answer.option.value, for: .normal)
        
        if answer.option.isRight {
            correctSetup()
        } else {
            incorrectSetup()
        }
    }
    
    func correctSetup() {
        optionButton.backgroundColor = greenColor
        checkImageView.tintColor = greenColor
        isCorrectLabel.text = String.History.correct
        checkImageView.image = UIImage(named: "circle-checked")
    }
    
    func incorrectSetup() {
        optionButton.backgroundColor = redColor
        checkImageView.tintColor = redColor
        isCorrectLabel.text = String.History.incorrect
        checkImageView.image = UIImage(named: "circle-x")
    }
    
}
