//
//  HistoryHistoryViewController.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewInput {
    @IBOutlet weak var tableView: UITableView!
    
    var output: HistoryViewOutput!
    lazy var historyDisplayManager: HistoryDisplayManager = {
        let displayManager = HistoryDisplayManager(tableView)
        return displayManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        historyDisplayManager.delegate = self
    }
    
    func update(_ sessions: [Session]) {
        historyDisplayManager.sessions = sessions
    }
}

extension HistoryViewController: HistoryDisplayManagerDelegate {
    func historyDisplayManager(_ historyDisplayManager: HistoryDisplayManager, didSelect session: Session) {
        
    }
}
