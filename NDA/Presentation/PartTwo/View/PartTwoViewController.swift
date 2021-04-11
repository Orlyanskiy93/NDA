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
    @IBOutlet var optionImageViews: [SelectableImageView]!
    @IBOutlet var optionButtons: [RoundedButton]!
    @IBOutlet weak var imageViewsStackView: UIStackView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var output: PartTwoViewOutput!
    var questionBank = QuestionServiceImp.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        optionImageViews.forEach { (imageView) in
            imageView.delegate = self
        }
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
        optionButtons[0].setTitle(arithmeticQuestion.firstOption.value, for: .normal)
        optionButtons[1].setTitle(arithmeticQuestion.secondOption.value, for: .normal)
        optionButtons[2].setTitle(arithmeticQuestion.thirdOption.value, for: .normal)
        optionButtons[3].setTitle(arithmeticQuestion.fourthOption.value, for: .normal)
    }
    
    func fillImageViews(with identifyQuestion: QuestionPartTwo) {
        questionLabel.text = identifyQuestion.title
        
        buttonsStackView.isHidden = true
        imageViewsStackView.isHidden = false
        
        guard optionImageViews.count == 4 else {
            show(title: String.Error.error, message: String.Error.optionsCount)
            return
        }
        optionImageViews[0].image = UIImage(named: identifyQuestion.firstOption.value)
        optionImageViews[1].image = UIImage(named: identifyQuestion.secondOption.value)
        optionImageViews[2].image = UIImage(named: identifyQuestion.thirdOption.value)
        optionImageViews[3].image = UIImage(named: identifyQuestion.fourthOption.value)
    }
    
    func selectableImageView(didSelect selectableImageView: SelectableImageView) {
        if selectableImageView.state == .selected {
            optionImageViews.forEach { (imageView) in
                imageView.state = .notDetermined
            }
        } else {
            optionImageViews.forEach { (view) in
                view.state = .notSelected
            }
            selectableImageView.state = .selected
        }
    }
    
    @IBAction func buttonDidSelected(_ sender: UIButton) {
        let greenColor = UIColor.systemGreen
        let lightGrayColor = UIColor.lightGray
        if sender.backgroundColor == greenColor {
            sender.backgroundColor = lightGrayColor
        } else {
            optionButtons.forEach { (button) in
                button.backgroundColor = lightGrayColor
            }
            sender.backgroundColor = greenColor
        }
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        output.nextQuestion()
        optionImageViews.forEach { (imageView) in
            imageView.state = .notDetermined
        }
    }
}
