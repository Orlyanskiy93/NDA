//
//  PartTwoDescriptionPartTwoDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoDescriptionViewController: UIViewController, PartTwoDescriptionViewInput {

    var output: PartTwoDescriptionViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PartTwoDescriptionViewInput
    func setupInitialState() {
    }
}
