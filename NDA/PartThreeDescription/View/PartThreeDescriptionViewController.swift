//
//  PartThreeDescriptionPartThreeDescriptionViewController.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeDescriptionViewController: UIViewController, PartThreeDescriptionViewInput {

    var output: PartThreeDescriptionViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PartThreeDescriptionViewInput
    func setupInitialState() {
    }
}
