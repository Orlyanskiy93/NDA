//
//  QuestionnaireEndScreenQuestionnaireEndScreenViewController.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireEndScreenViewController: UIViewController, QuestionnaireEndScreenViewInput {
    @IBOutlet weak var finishingMessageLabel: UILabel!
    @IBOutlet weak var scoreMessageLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var partOneLabel: UILabel!
    @IBOutlet weak var partTwoLabel: UILabel!
    @IBOutlet weak var partThreeLabel: UILabel!
    @IBOutlet weak var toHomeButton: RoundedButton!
    @IBOutlet weak var averageScoreLabel: UILabel!
    @IBOutlet weak var partOneScoreLabel: UILabel!
    @IBOutlet weak var partTwoScoreLabel: UILabel!
    @IBOutlet weak var partThreeScoreLabel: UILabel!
    
    var output: QuestionnaireEndScreenViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        finishingMessageLabel.text = String.Results.finishingMessage
        scoreMessageLabel.text = String.Results.scoreMessage
        averageLabel.text = String.Results.average
        partOneLabel.text = String.Results.part1
        partTwoLabel.text = String.Results.part2
        partThreeLabel.text = String.Results.part3
        toHomeButton.setTitle(String.Button.toHomePage, for: .normal)
    }
    
    func fill(with score: Score) {
        partOneScoreLabel.text = Int(score.partOne).description
        partTwoScoreLabel.text = Int(score.partTwo).description
        partThreeScoreLabel.text = Int(score.partThree).description
        averageScoreLabel.text = Int(score.average).description
    }
    
    @IBAction func toHome(_ sender: UIButton) {
        output.goToHomeScreen()
    }
}
