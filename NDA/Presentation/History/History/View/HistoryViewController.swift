//
//  HistoryHistoryViewController.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewInput {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var output: HistoryViewOutput!
    lazy var historyDisplayManager: HistoryDisplayManager = {
        let displayManager = HistoryDisplayManager(tableView)
        return displayManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //TODO:
        super.viewWillAppear(true)
        output.viewIsReady()
        historyDisplayManager.tableView.reloadData()
    }

    func setupInitialState() {
        historyDisplayManager.delegate = self
    }
    
    func emptySessionsViewSetup() {
        container.isHidden = true
        messageLabel.isHidden = false
    }
    
    func update(_ sessions: [Session]) {
        historyDisplayManager.sessions = sessions
        container.isHidden = false
        messageLabel.isHidden = true
    }
}

extension HistoryViewController: HistoryDisplayManagerDelegate {
    func historyDisplayManager(_ historyDisplayManager: HistoryDisplayManager, didSelect session: Session) {
        output.didSelected(session)
    }
}
