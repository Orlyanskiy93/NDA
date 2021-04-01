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
    @IBOutlet var optionButtons: [RoundedButton]!
    
    var output: PartTwoViewOutput!
    var questionBank = QuestionBankImp.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
    }
    
    func fillButtonsTitle(with arithmeticQuestion: QuestionPartTwo) {
        questionLabel.text = arithmeticQuestion.title
        
        resetOptions()
        optionButtons[0].setTitle(arithmeticQuestion.firstOption.value, for: .normal)
        optionButtons[1].setTitle(arithmeticQuestion.secondOption.value, for: .normal)
        optionButtons[2].setTitle(arithmeticQuestion.thirdOption.value, for: .normal)
        optionButtons[3].setTitle(arithmeticQuestion.fourthOption.value, for: .normal)
    }
    
    func resetOptions() {
        optionButtons.forEach { button in
            button.setBackgroundImage(.none, for: .normal)
            button.setTitle(nil, for: .normal)
        }
    }
    
    func fillButtonsBackground(with identifyQuestion: QuestionPartTwo) {
        questionLabel.text = identifyQuestion.title

        resetOptions()
        optionButtons[0].setBackgroundImage(UIImage(named: identifyQuestion.firstOption.value), for: .normal)
        optionButtons[1].setBackgroundImage(UIImage(named: identifyQuestion.secondOption.value), for: .normal)
        optionButtons[2].setBackgroundImage(UIImage(named: identifyQuestion.thirdOption.value), for: .normal)
        optionButtons[3].setBackgroundImage(UIImage(named: identifyQuestion.fourthOption.value), for: .normal)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        output.nextQuestion()
    }
}
