//
//  PartOnePartOneViewController.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneViewController: UIViewController, PartOneViewInput {
    @IBOutlet var numberLabels: [UILabel]!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var cannotCertainLabel: UILabel!
    @IBOutlet weak var moderatelyCertainLabel: UILabel!
    @IBOutlet weak var highlyCertainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var buttonsStackView: ButtonsStackView!
    
    var output: PartOneViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState(with questionsCount: Int) {
        nextButton.setTitle(String.Button.next, for: .normal)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationController?.navigationBar.isHidden = true
        buttonsStackView.createButtons(count: questionsCount)
        buttonsStackView.delegate = self
        setupLabels()
        resetSlider()
    }
    
    func setupLabels() {
        instructionsLabel.text = String.PartOne.instructions
        cannotCertainLabel.text = String.PartOne.cannotCertain
        moderatelyCertainLabel.text = String.PartOne.moderatelyCertain
        highlyCertainLabel.text = String.PartOne.highlyCertain
    }
    
    func updateProgressView(with value: Float) {
        progressView.progress = value
    }
    
    func highlitingText(with sliderValue: Float) {
        let index = Int(sliderValue.rounded())
        let baseFontSize: CGFloat = 17
        let increasedFontSize: CGFloat = 25
        numberLabels.forEach { (label) in
            label.font = UIFont.systemFont(ofSize: baseFontSize)
        }
        numberLabels[index].font = UIFont.boldSystemFont(ofSize: increasedFontSize)
    }
    
    @IBAction func valueChange(_ sender: UISlider) {
        highlitingText(with: sender.value)
    }
        
    @IBAction func chooseAnswer(_ sender: UIButton) {
        let index = output.chosenQuestionNumber
        buttonsStackView.setButtonState(index: index, to: .answered)
        output.answerDidChosen(with: Int(slider.value.rounded()))        
        resetSlider()
    }
    
    func resetSlider() {
        let defaultValue: Float = 5
        slider.value = defaultValue
        highlitingText(with: slider.value)
    }
    
    func show(_ question: QuestionPartOne) {
        questionLabel.text = question
        let index = output.chosenQuestionNumber
        buttonsStackView.setSelected(index: index, true)
    }
    
    func showEditing(_ question: QuestionPartOne, with answerValue: Float) {
        questionLabel.text = question
        slider.value = answerValue
        highlitingText(with: slider.value)
        let index = output.chosenQuestionNumber
        buttonsStackView.setSelected(index: index, true)
    }
}

extension PartOneViewController: ButtonsStackViewDelegate {
    func buttonsStackView(didSelected button: StackViewButton) {
        buttonsStackView.buttons.forEach { button in
            button.isSelected = false
        }
        button.isSelected = true
        output.editQuestion(with: button.identifier)
    }
}
