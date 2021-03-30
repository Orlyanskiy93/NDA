//
//  PartTwoPartTwoViewController.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoViewController: UIViewController, PartTwoViewInput {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    var output: PartTwoViewOutput!
    var questionBank = QuestionBankImp.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        
    }
    
    func fillButtonsTitle(with arithmeticQuestion: Question) {
        questionLabel.text = arithmeticQuestion.title
        guard let firstAnswer = arithmeticQuestion.answers?[0],
              let secondAnswer = arithmeticQuestion.answers?[1],
              let thirdAnswer = arithmeticQuestion.answers?[2],
              let fourthAnswer = arithmeticQuestion.answers?[3] else {
            return
        }
        firstAnswerButton.setTitle(firstAnswer, for: .normal)
        firstAnswerButton.setBackgroundImage(.none, for: .normal)
        secondAnswerButton.setTitle(secondAnswer, for: .normal)
        secondAnswerButton.setBackgroundImage(.none, for: .normal)
        thirdAnswerButton.setTitle(thirdAnswer, for: .normal)
        thirdAnswerButton.setBackgroundImage(.none, for: .normal)
        fourthAnswerButton.setTitle(fourthAnswer, for: .normal)
        fourthAnswerButton.setBackgroundImage(.none, for: .normal)
    }
    
    func fillButtonsBackground(with identifyQuestion: Question) {
        questionLabel.text = identifyQuestion.title
        guard let firstAnswer = identifyQuestion.answers?[0],
              let secondAnswer = identifyQuestion.answers?[1],
              let thirdAnswer = identifyQuestion.answers?[2],
              let fourthAnswer = identifyQuestion.answers?[3] else {
            return
        }
        firstAnswerButton.setTitle("", for: .normal)
        firstAnswerButton.setBackgroundImage(UIImage(named: firstAnswer), for: .normal)
        secondAnswerButton.setTitle("", for: .normal)
        secondAnswerButton.setBackgroundImage(UIImage(named: secondAnswer), for: .normal)
        thirdAnswerButton.setTitle("", for: .normal)
        thirdAnswerButton.setBackgroundImage(UIImage(named: thirdAnswer), for: .normal)
        fourthAnswerButton.setTitle("", for: .normal)
        fourthAnswerButton.setBackgroundImage(UIImage(named: fourthAnswer), for: .normal)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        output.nextQuestion()
    }
}
