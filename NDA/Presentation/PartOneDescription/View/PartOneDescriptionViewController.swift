//
//  PartOneDescriptionPartOneDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDescriptionViewController: UIViewController, PartOneDescriptionViewInput {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var okButton: RoundedButton!
    
    var output: PartOneDescriptionViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        titleLabel.text = String.PartOne.title
        descriptionLabel.text = String.PartOne.moduleDescription
        okButton.setTitle(String.Button.ok, for: .normal)
    }
}
