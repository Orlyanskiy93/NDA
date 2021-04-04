//
//  PartOneDescriptionPartOneDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDescriptionViewController: UIViewController, PartOneDescriptionViewInput {

    var output: PartOneDescriptionViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PartOneDescriptionViewInput
    func setupInitialState() {
    }
}
