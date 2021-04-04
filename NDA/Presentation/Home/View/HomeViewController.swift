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
        beginQuestionnaireButton.setTitle(String.Home.beginQuestionnaire, for: .normal)
    }
    
    @IBAction func begin(_ sender: UIButton) {
        output.begin()
    }
}
