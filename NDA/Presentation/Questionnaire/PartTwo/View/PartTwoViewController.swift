//
//  PartTwoPartTwoViewController.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoViewController: UIViewController, PartTwoViewInput, SelectableImageDelegate {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var optionImageViews: [OptionSelectableImageView]!
    @IBOutlet var optionButtons: [OptionSelectableButton]!
    @IBOutlet weak var imageViewsStackView: UIStackView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var progressView: UIProgressView!
        
    var output: PartTwoViewOutput!
    var chosenOption: Option?

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        navigationController?.navigationBar.isHidden = true
        optionImageViews.forEach { (imageView) in
            imageView.delegate = self
        }
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
        questionLabel.text = arithmeticQuestion.title
        imageViewsStackView.isHidden = true
        buttonsStackView.isHidden = false
        
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
        questionLabel.text = identifyQuestion.title
        
        buttonsStackView.isHidden = true
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
