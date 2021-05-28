//
//  SessionDescriptionSessionDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class SessionDescriptionViewController: UIViewController, SessionDescriptionViewInput {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var averageScoreLabel: UILabel!
    @IBOutlet weak var averageScoreValueLabel: UILabel!
    @IBOutlet weak var partOneLabel: UILabel!
    @IBOutlet weak var partOneAverageScoreLabel: UILabel!
    @IBOutlet weak var partTwoLabel: UILabel!
    @IBOutlet weak var partTwoAverageScoreLabel: UILabel!
    @IBOutlet weak var partThreeLabel: UILabel!
    @IBOutlet weak var partThreeAverageScoreLabel: UILabel!
    @IBOutlet weak var partOneSelectibleView: UIView!
    @IBOutlet weak var partTwoSelectibleView: UIView!
    @IBOutlet weak var partThreeSelectibleView: UIView!
    
    var output: SessionDescriptionViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
    }
    
    func fill(with session: Session) {
        dateLabel.text = DateFormatter.stringForSession(session.completionDate)
        averageScoreLabel.text = String.Results.average
        averageScoreValueLabel.text = Int(session.score.average).description
        partOneLabel.text = String.PartOne.title
        partOneAverageScoreLabel.text = Int(session.score.partOne).description
        partTwoLabel.text = String.PartTwo.title
        partTwoAverageScoreLabel.text = Int(session.score.partTwo).description
        partThreeLabel.text = String.PartThree.partThreeTitle
        partThreeAverageScoreLabel.text = Int(session.score.partThree).description
    }
    
    @IBAction func showPartOneDetails(_ sender: Any) {
        output.openPartOneDetails()
    }
    
    @IBAction func showPartTwoDetails(_ sender: Any) {
        output.openPartTwoDetails()
    }
    
    @IBAction func showPartThreeDetails(_ sender: Any) {
        output.openPartThreeDetails()
    }
}
