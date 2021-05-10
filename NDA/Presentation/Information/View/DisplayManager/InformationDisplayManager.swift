//
//  InformationDisplayManager.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 09.05.2021.
//
import UIKit

class InformationDisplayManager: NSObject {
    var tableView: UITableView!
    var informationTuple: [(title: String, description: String)] = [] {
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
        tableView.register(InformationCell.nib, forCellReuseIdentifier: InformationCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
        
}

extension InformationDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationTuple.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.identifier) as! InformationCell
        let tuple = informationTuple[indexPath.row]
        cell.fill(with: tuple)
        cell.descriptionLabel.numberOfLines = 3
        return cell
    }
}

extension InformationDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? InformationCell else {
            return
        }
        tableView.beginUpdates()
        if cell.content == .rolled {
            cell.content = .unrolled
        } else {
            cell.content = .rolled
        }
        tableView.endUpdates()
    }
}
