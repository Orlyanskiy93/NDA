//
//  PartTwoDescriptionPartTwoDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoDescriptionViewController: UIViewController, PartTwoDescriptionViewInput {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var okButtton: RoundedButton!
    
    var output: PartTwoDescriptionViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        titleLabel.text = String.PartTwo.title
        textView.text = String.PartTwo.moduleDescription
        okButtton.setTitle(String.Button.ok, for: .normal)
    }
}
