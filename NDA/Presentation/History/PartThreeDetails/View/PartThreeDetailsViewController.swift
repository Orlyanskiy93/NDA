//
//  PartThreeDetailsPartThreeDetailsViewController.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeDetailsViewController: UIViewController, PartThreeDetailsViewInput {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var partTitleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var gfIndexLabel: UILabel!
    
    @IBOutlet weak var gfIndexValueLabel: UILabel!
    var output: PartThreeDetailsViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
    }
    
    func fill(with session: Session) {
        dateLabel.text = DateFormatter.stringForSession(session.completionDate)
        partTitleLabel.text = String.History.partThree
        scoreLabel.text = Int(session.score.partThree).description
        questionLabel.text = session.answerPartThree.question
        yourAnswerLabel.text = String.History.yourAnswer
        answerLabel.text = session.answerPartThree.answer
        gfIndexLabel.text = String.History.gfIndex
        gfIndexValueLabel.text = session.answerPartThree.gunningFogIndex.description
    }
}
