//
//  HomeHomeViewController.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    @IBOutlet weak var beginQuestionnaireButton: RoundedButton!
    var output: HomeViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        beginQuestionnaireButton.setTitle(String.Button.beginQuestionnaire, for: .normal)
    }
    
    @IBAction func begin(_ sender: UIButton) {
        output.runSession()
    }
    
    func updateButton(with days: Int) {
        if days > 1 {
            beginQuestionnaireButton.setTitle("\(days) " + String.Button.daysToNextSession, for: .normal)
            beginQuestionnaireButton.backgroundColor = .systemGray
            beginQuestionnaireButton.isEnabled = false
        }
        if days == 1 {
            beginQuestionnaireButton.setTitle("\(days) " + String.Button.daysToNextSession, for: .normal)
            beginQuestionnaireButton.backgroundColor = .systemBlue
            beginQuestionnaireButton.isEnabled = false
        }
        if days < 1 {
            beginQuestionnaireButton.setTitle(String.Button.beginQuestionnaire, for: .normal)
            beginQuestionnaireButton.backgroundColor = .systemBlue
            beginQuestionnaireButton.isEnabled = true
        }
    }
}
