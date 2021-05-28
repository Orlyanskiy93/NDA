//
//  PartThreeDescriptionPartThreeDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeDescriptionViewController: UIViewController, PartThreeDescriptionViewInput {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var okButton: RoundedButton!
    
    var output: PartThreeDescriptionViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        titleLabel.text = String.PartThree.partThreeTitle
        descriptionLabel.text = String.PartThree.partThreeDescription
        okButton.setTitle(String.Button.ok, for: .normal)
    }
}
