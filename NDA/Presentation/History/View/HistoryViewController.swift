//
//  HistoryHistoryViewController.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewInput {

    var output: HistoryViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: HistoryViewInput
    func setupInitialState() {
    }
}
