//
//  PartTwoDetailsPartTwoDetailsViewController.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoDetailsViewController: UIViewController, PartTwoDetailsViewInput {

    @IBOutlet weak var tableView: UITableView!
    var output: PartTwoDetailsViewOutput!
    lazy var displayManager: PartTwoDetailsDisplayManager = {
        let displayManager = PartTwoDetailsDisplayManager(tableView)
        return displayManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
    }
        
    func update(_ session: Session) {
        displayManager.session = session
    }
}
