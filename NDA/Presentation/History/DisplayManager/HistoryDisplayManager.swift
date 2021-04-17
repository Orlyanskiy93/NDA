//
//  HistoryDisplayManager.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 17.04.2021.
//

import UIKit

class HistoryDisplayManager: NSObject{
    var tableView: UITableView!
    var delegate: HistoryDisplayManagerDelegate!
    var sessions: [Session] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: HistoryCell.identifier, bundle: .none)
        tableView.register(nib, forCellReuseIdentifier: HistoryCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension HistoryDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.historyDisplayManager(self, didSelect: sessions[indexPath.row])
    }
}

extension HistoryDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifier) as! HistoryCell
        let session = sessions[indexPath.row]
        cell.fill(with: session)
        return cell
    }
}
