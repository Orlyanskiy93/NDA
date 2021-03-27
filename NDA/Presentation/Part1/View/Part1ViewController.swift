//
//  Part1Part1ViewController.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class Part1ViewController: UIViewController, Part1ViewInput {

    var output: Part1ViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: Part1ViewInput
    func setupInitialState() {
    }
}
