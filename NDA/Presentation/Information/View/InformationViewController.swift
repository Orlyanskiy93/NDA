//
//  InformationInformationViewController.swift
//  NDA
//
//  Created by Dmitriy on 09/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, InformationViewInput {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var informationNavigationItem: UINavigationItem!
    lazy var displayManager = InformationDisplayManager(tableView)
    
    var output: InformationViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
<<<<<<< HEAD
        navigationItem.title = String.Information.information
=======
        informationNavigationItem.title = String.Information.information
>>>>>>> Develop
    }
    
    func update(_ faqArray: [FAQ]) {
        displayManager.faqArray = faqArray
    }
}
