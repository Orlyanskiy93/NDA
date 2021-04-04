//
//  QuestionnaireInformationQuestionnaireInformationViewController.swift
//  NDA
//
//  Created by Dmitriy on 01/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireInformationViewController: UIViewController, QuestionnaireInformationViewInput {

    var output: QuestionnaireInformationViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: QuestionnaireInformationViewInput
    func setupInitialState() {
    }
    @IBAction func begin(_ sender: UIButton) {
        output.loadQuestionnaire()
    }
}
