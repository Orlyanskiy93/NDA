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
    @IBOutlet weak var progressView: UIProgressView!
    
    var output: PartOneViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
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
        // TODO: tag
        numberLabels[index].font = UIFont.boldSystemFont(ofSize: increasedFontSize)
    }
    
    @IBAction func valueChange(_ sender: UISlider) {
        highlitingText(with: sender.value)
    }
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
        output.answerDidChosen(with: Int(slider.value))
        resetSlider()
    }
    
    func resetSlider() {
        let defaultValue: Float = 5
        slider.value = defaultValue
        highlitingText(with: slider.value)
    }
    
    func show(_ question: QuestionPartOne) {
        questionLabel.text = question
    }
}
