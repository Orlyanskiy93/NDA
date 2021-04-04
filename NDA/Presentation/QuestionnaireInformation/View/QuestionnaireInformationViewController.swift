//
//  QuestionnaireInformationQuestionnaireInformationViewController.swift
//  NDA
//
//  Created by Dmitriy on 01/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireInformationViewController: UIViewController, QuestionnaireInformationViewInput {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var beginButton: RoundedButton!
    var output: QuestionnaireInformationViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        textView.text = String.Home.questionnaireDescription
        beginButton.setTitle(String.Button.begin, for: .normal)
    }
    
    @IBAction func begin(_ sender: UIButton) {
        output.loadQuestionnaire()
    }
}
