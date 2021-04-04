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
    @IBOutlet var optionImageViews: [SelectableImage]!
    @IBOutlet var optionButtons: [RoundedButton]!
    @IBOutlet weak var imageViewsStackView: UIStackView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    var progress: Progress!
    
    var output: PartTwoViewOutput!
    var questionBank = QuestionBankImp.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        updateProgressView()
        optionImageViews[0].delegate = self
        optionImageViews[1].delegate = self
        optionImageViews[2].delegate = self
        optionImageViews[3].delegate = self
    }
    
    func setupProgressView(with questions: [QuestionPartTwo]) {
        progress = Progress(totalUnitCount: Int64(questions.count))
    }
    
    func updateProgressView() {
        let progressFloat = Float(progress.fractionCompleted)
        progressView.setProgress(progressFloat, animated: true)
    }

    func fillButtonsTitle(with arithmeticQuestion: QuestionPartTwo) {
        questionLabel.text = arithmeticQuestion.title
        imageViewsStackView.isHidden = true
        buttonsStackView.isHidden = false

        optionButtons[0].setTitle(arithmeticQuestion.firstOption.value, for: .normal)
        optionButtons[1].setTitle(arithmeticQuestion.secondOption.value, for: .normal)
        optionButtons[2].setTitle(arithmeticQuestion.thirdOption.value, for: .normal)
        optionButtons[3].setTitle(arithmeticQuestion.fourthOption.value, for: .normal)
    }
    
    func fillButtonsBackground(with identifyQuestion: QuestionPartTwo) {
        questionLabel.text = identifyQuestion.title
        
        buttonsStackView.isHidden = true
        imageViewsStackView.isHidden = false
        optionImageViews[0].image = UIImage(named: identifyQuestion.firstOption.value)
        optionImageViews[1].image = UIImage(named: identifyQuestion.secondOption.value)
        optionImageViews[2].image = UIImage(named: identifyQuestion.thirdOption.value)
        optionImageViews[3].image = UIImage(named: identifyQuestion.fourthOption.value)
    }
    
    func imageDidSelected(_ selectableImage: SelectableImage, with condition: SelectableImage.Condition) {
        if condition == .selected {
            optionImageViews.forEach { (image) in
                image.notSelectedColorSetup()
                image.isSelected = false
            }
            selectableImage.selectedColorSetup()
            selectableImage.isSelected = true
        }
        if condition == .notSelected {
            optionImageViews.forEach { (image) in
                image.baseColorSetup()
            }
            selectableImage.isSelected = false
        }
    }

    @IBAction func nextQuestion(_ sender: UIButton) {
        output.nextQuestion()
        progress.completedUnitCount += 1
        updateProgressView()
    }
}
