//
//  HistoryDisplayManager.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 17.04.2021.
//
import UIKit

class HistoryDisplayManager: NSObject {
    var tableView: UITableView!
    weak var delegate: HistoryDisplayManagerDelegate!
    var sessions: [Session] = [] {
        didSet {
            setHeader()
            tableView.reloadData()
        }
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(HistoryCell.nib, forCellReuseIdentifier: HistoryCell.identifier)
        tableView.register(ChartHeaderView.nib, forHeaderFooterViewReuseIdentifier: ChartHeaderView.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
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
    
    func setHeader() {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChartHeaderView.identifier) as! ChartHeaderView
        header.setup(with: sessions)
        tableView.tableHeaderView = header
    }
}
