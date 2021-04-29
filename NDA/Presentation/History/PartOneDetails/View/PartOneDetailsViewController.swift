//
//  PartOneDetailsPartOneDetailsViewController.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDetailsViewController: UIViewController, PartOneDetailsViewInput {

    @IBOutlet weak var tableView: UITableView!
    var output: PartOneDetailsViewOutput!
    lazy var displayManager: PartOneDetailsDisplayManager = {
        let displayManager = PartOneDetailsDisplayManager(tableView)
        return displayManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        output.viewIsReady()
    }

    func setupInitialState() {
    }
        
    func update(_ session: Session) {
        displayManager.session = session
    }
}
