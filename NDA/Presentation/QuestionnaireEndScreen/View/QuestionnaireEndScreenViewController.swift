//
//  QuestionnaireEndScreenQuestionnaireEndScreenViewController.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireEndScreenViewController: UIViewController, QuestionnaireEndScreenViewInput {
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
    }
    
    func fill(with score: Score) {
        partOneScoreLabel.text = Int(score.partOne).description
        partTwoScoreLabel.text = Int(score.partTwo).description
        partThreeScoreLabel.text = Int(score.partThree).description
        averageScoreLabel.text = Int(score.average).description
    }
}
