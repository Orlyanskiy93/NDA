//
//  PartTwoPartTwoViewController.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoViewController: UIViewController, PartTwoViewInput, SelectableImageViewDelegate {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var optionImageViews: [OptionSelectableImageView]!
    @IBOutlet var optionButtons: [OptionSelectableButton]!
    @IBOutlet weak var imageViewsStackView: UIStackView!
    @IBOutlet weak var optionButtonsStackView: UIStackView!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionButtonsStackView: ButtonsStackView!
    
    var output: PartTwoViewOutput!
    var chosenOption: Option?

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setup(with questionsCount: Int) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationController?.navigationBar.isHidden = true
        nextButton.setTitle(String.Button.next, for: .normal)
        optionImageViews.forEach { (imageView) in
            imageView.delegate = self
        }
        questionButtonsStackView.createButtons(count: questionsCount)
        optionNotSelectedNextButtonSetup()
    }
    
    func optionSelectedNextButtonSetup() {
        nextButton.isEnabled = true
        nextButton.backgroundColor = .systemGreen
    }
    
    func optionNotSelectedNextButtonSetup() {
        nextButton.backgroundColor = .gray
        nextButton.isEnabled = false
    }
    
    func updateProgressView(with value: Float) {
        progressView.progress = value
    }
    
    func fillButtons(with arithmeticQuestion: QuestionPartTwo) {
        let index = output.chosenQuestion
        questionButtonsStackView.setSelected(index: index, false)
        questionLabel.text = arithmeticQuestion.title
        imageViewsStackView.isHidden = true
        optionButtonsStackView.isHidden = false
        
        guard optionButtons.count == 4 else {
            show(title: String.Error.error, message: String.Error.optionsCount)
            return
        }
        optionButtons.forEach { (button) in
            button.backgroundColor = .lightGray
        }
        
        optionButtons[0].fill(with: arithmeticQuestion.firstOption)
        optionButtons[1].fill(with: arithmeticQuestion.secondOption)
        optionButtons[2].fill(with: arithmeticQuestion.thirdOption)
        optionButtons[3].fill(with: arithmeticQuestion.fourthOption)
    }
    
    func fillImageViews(with identifyQuestion: QuestionPartTwo) {
        let index = output.chosenQuestion
        questionButtonsStackView.setSelected(index: index, false)
        questionLabel.text = identifyQuestion.title
        
        optionButtonsStackView.isHidden = true
        imageViewsStackView.isHidden = false
        
        guard optionImageViews.count == 4 else {
            show(title: String.Error.error, message: String.Error.optionsCount)
            return
        }
        
        optionImageViews[0].fill(with: identifyQuestion.firstOption)
        optionImageViews[1].fill(with: identifyQuestion.secondOption)
        optionImageViews[2].fill(with: identifyQuestion.thirdOption)
        optionImageViews[3].fill(with: identifyQuestion.fourthOption)        
    }
    
    func selectableImageView(didSelect selectableImageView: OptionSelectableImageView) {
        optionImageViews.forEach { (view) in
            view.state = .notSelected
        }
        selectableImageView.state = .selected
        
        chosenOption = selectableImageView.option
        optionSelectedNextButtonSetup()
    }
        
    @IBAction func buttonDidSelected(_ sender: OptionSelectableButton) {
        optionButtons.forEach { (button) in
            button.isSelected = false
        }
        sender.isSelected = true
        
        chosenOption = sender.option
        optionSelectedNextButtonSetup()
    }
    
    func resetOptions() {
        optionImageViews.forEach { (imageView) in
            imageView.state = .notDetermined
        }
        optionButtons.forEach { (button) in
            button.isSelected = false
        }
        optionNotSelectedNextButtonSetup()
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        let index = output.chosenQuestion
        questionButtonsStackView.setButtonState(index: index, to: .answered)
        guard let option = chosenOption else {
            show(title: String.Error.error, message: String.Error.tryAgain) { [weak self] (_) in
                self?.output.loadQuestion()
            }
            return
        }
        output.didChosen(option)
        resetOptions()
    }
}
