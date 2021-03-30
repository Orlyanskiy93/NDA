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
    
    var output: PartOneViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        instructionsLabel.text = String.PartOne.instructions
        cannotCertainLabel.text = String.PartOne.cannotCertain
        moderatelyCertainLabel.text = String.PartOne.moderatelyCertain
        highlyCertainLabel.text = String.PartOne.highlyCertain
        slider.value = 5
        highlitingText(with: slider.value)
    }
    
    func highlitingText(with sliderValue: Float) {
        let index = Int(sliderValue.rounded())
        numberLabels.forEach { (label) in
            label.font = UIFont.systemFont(ofSize: 17)
        }
        numberLabels[index].font = UIFont.systemFont(ofSize: 25)
        numberLabels[index].font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    @IBAction func valueChange(_ sender: UISlider) {
        highlitingText(with: sender.value)
    }
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
        output.answerDidChosen(with: Int(slider.value))
        slider.value = 5
        highlitingText(with: slider.value)
    }
    
    func show(_ question: QuestionPartOne) {
        questionLabel.text = question
    }
}
