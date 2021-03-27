//
//  PartOnePartOneViewController.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneViewController: UIViewController, PartOneViewInput {
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
    }
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
        output.nextQuestion()
        output.score += Int(slider.value)
    }
    
    func show(_ question: Question) {
        questionLabel.text = question.title
    }
}
