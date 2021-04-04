//
//  PartOneDescriptionPartOneDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDescriptionViewController: UIViewController, PartOneDescriptionViewInput {
    @IBOutlet weak var partDescriptionLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var okButton: RoundedButton!
    
    var output: PartOneDescriptionViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        partDescriptionLabel.text = String.PartOne.title
        textView.text = String.PartOne.moduleDescription
        okButton.setTitle(String.Button.ok, for: .normal)
    }
}
